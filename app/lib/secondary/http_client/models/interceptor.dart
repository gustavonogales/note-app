import 'request.dart';
import 'response.dart';

abstract class Interceptor {
  Request interceptRequest(Request request);
  Response interceptResponse(Response response);
}
