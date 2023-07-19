import 'request.dart';
import 'response.dart';

abstract class Interceptor {
  Request interceptRequest(Request request);
  Future<Response> interceptResponse(Response response);
}
