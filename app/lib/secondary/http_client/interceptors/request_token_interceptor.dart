import 'package:injectable/injectable.dart';
import 'package:note_app/domain/services/user_service.dart';

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
    final token = _storagePort.get(UserService.tokenKey);
    if (token != null) {
      request.headers.addAll({'Authorization': 'Bearer $token'});
    }
    return request;
  }

  @override
  Future<Response> interceptResponse(Response response) =>
      Future.value(response);
}
