import '../models/method.dart';
import '../models/response.dart';

abstract interface class HttpClientPort {
  Future<Response> send({
    required String to,
    required Method method,
    Map<dynamic, dynamic>? body,
    Map<String, String> headers,
    String contentType,
  });
}
