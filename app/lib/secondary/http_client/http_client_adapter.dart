import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'interceptors/request_token_interceptor.dart';
import 'models/http_send_exception.dart';
import 'models/interceptor.dart';
import 'models/method.dart';
import 'models/request.dart';
import 'models/response.dart';
import 'ports/http_client_port.dart';

@Singleton(as: HttpClientPort)
final class HttpClientAdapter implements HttpClientPort {
  late final http.Client _client;
  late String _baseUrl;

  List<Interceptor> requestInterceptors = List.empty(growable: true);
  List<Interceptor> responseInterceptors = List.empty(growable: true);

  HttpClientAdapter(RequestTokenInterceptor requestTokenInterceptor) {
    _baseUrl = 'http://10.0.2.2:3333';
    _client = http.Client();
    requestInterceptors.add(requestTokenInterceptor);
  }

  String treatPath(String path) =>
      path.substring(0, 1) == '/' ? path.substring(1) : path;

  @override
  Future<Response> send({
    required String to,
    required Method method,
    Map<dynamic, dynamic>? body,
    Map<String, String> headers = const {},
    String contentType = 'application/json',
  }) async {
    final httpRequest = _buildHttpRequest(
      to: to,
      method: method,
      body: body,
      contentType: contentType,
      headers: headers,
    );

    var request = Request(
      url: httpRequest.url,
      body: httpRequest.body,
      headers: httpRequest.headers,
      method: method,
      path: to,
    );

    for (var interceptor in requestInterceptors) {
      request = interceptor.interceptRequest(request);
    }

    final streamedResponse = await _client.send(httpRequest);
    final httpResponse = await http.Response.fromStream(streamedResponse);
    log("got here - ${httpResponse.body.toString()}");

    try {
      var json = jsonDecode(httpResponse.body);
    } catch (e) {
      log("GOT ERROR - " + e.toString());
    }

    var response = Response(
      statusCode: httpResponse.statusCode,
      body: jsonDecode(httpResponse.body),
      headers: httpResponse.headers,
      request: request,
    );

    log("got here 2 - ${response.body.toString()}");

    for (var interceptor in responseInterceptors) {
      response = interceptor.interceptResponse(response);
    }

    // Client or Server Error
    if (response.statusCode >= 400) {
      throw HttpSendException(
        statusCode: response.statusCode,
        message: response.body['message'] ?? 'Unexpected Error',
      );
    }

    return response;
  }

  http.Request _buildHttpRequest({
    required String to,
    required Method method,
    required Map<String, String> headers,
    required String contentType,
    Map<dynamic, dynamic>? body,
  }) {
    var request = http.Request(
      method.name,
      Uri.parse('$_baseUrl/${treatPath(to)}'),
    );
    request.headers.addAll(headers);
    request.headers.addEntries([MapEntry('Content-Type', contentType)]);

    if (body != null) {
      request.body = jsonEncode(body);
    }
    return request;
  }
}
