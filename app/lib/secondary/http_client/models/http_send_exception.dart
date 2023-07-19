final class HttpSendException implements Exception {
  final int statusCode;
  final String message;

  const HttpSendException({
    required this.statusCode,
    required this.message,
  });

  @override
  String toString() {
    return '[HttpSendException] - $message';
  }
}
