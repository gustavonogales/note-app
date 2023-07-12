import 'package:injectable/injectable.dart';

import '../../storage/ports/storage_port.dart';
import '../models/models.dart';

@injectable
class RequestTokenInterceptor extends Interceptor {
  late final StoragePort _storagePort;

  RequestTokenInterceptor(StoragePort storagePort) {
    _storagePort = storagePort;
  }

  @override
  Request interceptRequest(Request request) {
    final token = _storagePort.get('token');
    if (token != null) {
      request.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return request;
  }

  @override
  Response interceptResponse(Response response) => response;
}
