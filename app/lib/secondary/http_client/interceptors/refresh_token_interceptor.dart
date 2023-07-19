import 'package:injectable/injectable.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

import '../../secondary.dart';

@injectable
final class RefreshTokenInterceptor extends Interceptor {
  UserServicePort get _userServicePort => locator();
  HttpClientPort get _httpClientPort => locator();
  GlobalStore get _globalStore => locator();

  @override
  Request interceptRequest(Request request) => request;

  @override
  Future<Response> interceptResponse(Response response) async {
    if (response.statusCode == 401) {
      try {
        await _userServicePort.refreshToken();
        return await _httpClientPort.retry(response.request);
      } catch (_) {
        _globalStore.auth.signOut();
        return response;
      }
    }
    return response;
  }
}
