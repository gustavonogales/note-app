import 'request.dart';

final class Response {
  final int statusCode;
  final Map<String, String> headers;
  final dynamic body;
  final Request request;

  const Response({
    required this.statusCode,
    required this.body,
    required this.request,
    this.headers = const {},
  });
}
