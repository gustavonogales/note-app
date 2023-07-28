import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:note_app/config/config.dart';
import 'package:note_app/domain/domain.dart';

import '../../../adapter/adapter.dart';
import '../../stores/root_store.dart';

@lazySingleton
final class RefreshTokenInterceptor extends Interceptor {
  UserServicePort get _userServicePort => locator();
  HttpClientPort get _httpClientPort => locator();
  RootStore get _globalStore => locator();

  @override
  Request interceptRequest(Request request) => request;

  @override
  Future<Response> interceptResponse(Response response) async {
    log(response.toString());
    if (response.statusCode == 401) {
      try {
        await _userServicePort.refreshToken();
        return await _httpClientPort.retry(response.request);
      } catch (_) {
        _globalStore.userStore.signOut();
        return response;
      }
    }
    return response;
  }
}
