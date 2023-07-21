import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:note_app/environment.dart';
import 'models/http_send_exception.dart';
import 'models/interceptor.dart';
import 'models/method.dart';
import 'models/request.dart';
import 'models/content_type.dart';
import 'models/response.dart';
import 'ports/http_client_port.dart';

@Singleton(as: HttpClientPort)
final class HttpClientAdapter implements HttpClientPort {
  late final http.Client _client;
  late String _baseUrl;

  @override
  List<Interceptor> requestInterceptors = [];

  @override
  List<Interceptor> responseInterceptors = [];

  HttpClientAdapter(
    AppEnvironment environment,
  ) {
    _baseUrl = environment.baseUrl;
    _client = http.Client();
  }

  String treatPath(String path) =>
      path.substring(0, 1) == '/' ? path.substring(1) : path;

  Uri uriParser(String to) => Uri.parse('$_baseUrl/${treatPath(to)}');

  @override
  Future<Response> send({
    required String to,
    required Method method,
    Map<dynamic, dynamic>? body,
    Map<String, File>? files,
    Map<String, String> headers = const {},
    ContentType contentType = ContentType.json,
    bool avoidInterceptors = false,
  }) async {
    http.BaseRequest httpRequest;

    switch (contentType) {
      case ContentType.multipart:
        httpRequest = _buildMultipartFormData(
          to: to,
          method: method,
          body: body,
          files: files,
          headers: headers,
        );
      default:
        httpRequest = _buildHttpRequest(
          to: to,
          method: method,
          body: body,
          contentType: contentType.name,
          headers: headers,
        );
    }

    var request = Request(
      url: httpRequest.url,
      body: body,
      contentType: contentType,
      headers: httpRequest.headers,
      method: method,
      path: to,
    );

    for (var interceptor in requestInterceptors) {
      request = interceptor.interceptRequest(request);
    }

    final streamedResponse = await _client.send(httpRequest);
    final httpResponse = await http.Response.fromStream(streamedResponse);

    var response = Response(
      statusCode: httpResponse.statusCode,
      body: httpResponse.body.isNotEmpty ? jsonDecode(httpResponse.body) : '',
      headers: httpResponse.headers,
      request: request,
    );

    if (!avoidInterceptors) {
      for (var interceptor in responseInterceptors) {
        response = await interceptor.interceptResponse(response);
      }
    }

    // Client or Server Error
    if (response.statusCode >= 400) {
      throw HttpSendException(
        statusCode: response.statusCode,
        message: response.body['message'] ??
            response.body['status'] ??
            'Unexpected Error',
      );
    }

    return response;
  }

  http.BaseRequest _buildMultipartFormData({
    required String to,
    required Method method,
    required Map<String, String> headers,
    Map<dynamic, dynamic>? body,
    Map<String, File>? files,
  }) {
    var request = http.MultipartRequest(method.name, uriParser(to));
    request.headers.addAll(headers);
    request.headers.addEntries([
      const MapEntry('Content-Type', 'multipart/form-data'),
    ]);

    if (body != null) {
      for (var i = 0; i < body.keys.length; i++) {
        request.fields[body.keys.toList()[i]] =
            body.values.toList()[i].toString();
      }
    }

    if (files != null) {
      for (var i = 0; i < files.keys.length; i++) {
        final file = files.values.toList()[i];
        final splittedFilename = file.path.split('/');
        final filename = '${splittedFilename.first}.${splittedFilename.last}';

        request.files.add(http.MultipartFile(
          files.keys.toList()[i],
          file.readAsBytes().asStream(),
          file.lengthSync(),
          filename: filename,
        ));
      }
    }
    return request;
  }

  http.Request _buildHttpRequest({
    required String to,
    required Method method,
    required Map<String, String> headers,
    required String contentType,
    Map<dynamic, dynamic>? body,
  }) {
    var request = http.Request(method.name, uriParser(to));
    request.headers.addAll(headers);
    request.headers.addEntries([MapEntry('Content-Type', contentType)]);

    if (body != null) {
      request.body = jsonEncode(body);
    }
    return request;
  }

  @override
  Future<Response> retry(Request request) => send(
        method: request.method,
        to: request.path,
        body: request.body,
        contentType: request.contentType,
        headers: request.headers,
        avoidInterceptors: true,
      );
}
