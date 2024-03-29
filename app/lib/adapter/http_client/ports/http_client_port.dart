import 'dart:io';

import '../models/models.dart';

abstract interface class HttpClientPort {
  Future<Response> send({
    required String to,
    required Method method,
    Map<dynamic, dynamic>? body,
    Map<String, File>? files,
    Map<String, String> headers,
    ContentType contentType,
    bool avoidInterceptors,
  });

  Future<Response> retry(Request request);

  List<Interceptor> requestInterceptors = [];
  List<Interceptor> responseInterceptors = [];
}
