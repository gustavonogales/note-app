import 'method.dart';

final class Request {
  final Uri url;
  final String path;
  final Method method;
  final Map<String, String> headers;
  final String contentType;
  final Map? body;

  const Request({
    required this.url,
    required this.path,
    required this.method,
    required this.contentType,
    required this.headers,
    this.body,
  });
}
