import 'dart:convert';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/models/user.dart';
import 'package:note_app/adapter/adapter.dart';

import '../ports/user_service_port.dart';
import 'dtos/user.dto.dart';

@Singleton(as: UserServicePort)
final class UserService implements UserServicePort {
  static const tokenKey = 'token';
  static const _refreshTokenKey = 'refreshToken';
  static const _userKey = 'user';

  late HttpClientPort _httpAdapter;
  late StoragePort _storageAdapter;

  UserService(HttpClientPort httpAdapter, StoragePort storageAdapter) {
    _httpAdapter = httpAdapter;
    _storageAdapter = storageAdapter;
  }

  @override
  Future<User> signIn({required String email, required String password}) async {
    final response = await _httpAdapter.send(
      to: '/session',
      method: Method.post,
      body: {'email': email, 'password': password},
    );

    final user = UserDto.fromJson(response.body['user']);

    await _save(
      token: response.body['token'],
      refreshToken: response.body['refreshToken'],
      user: user,
    );

    return user;
  }

  @override
  Future<void> signOut() => _storageAdapter.removeAll();

  @override
  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _httpAdapter.send(
      to: '/user',
      method: Method.post,
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    return UserDto.fromJson(response.body);
  }

  @override
  Future<User> update({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _httpAdapter.send(
      to: '/user',
      method: Method.patch,
      body: {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    final user = UserDto.fromJson(response.body);
    _storageAdapter.save(_userKey, jsonEncode(UserDto.toJson(user)));
    return user;
  }

  @override
  User? signedUser() {
    final payload = _storageAdapter.get(_userKey);
    if (payload == null) return null;
    return UserDto.fromJson(jsonDecode(payload));
  }

  @override
  Future<void> refreshToken() async {
    final refreshToken = _storageAdapter.get(_refreshTokenKey);

    final response = await _httpAdapter.send(
      to: '/session/refresh',
      method: Method.post,
      body: {'refreshToken': refreshToken},
      avoidInterceptors: true,
    );

    final user = UserDto.fromJson(response.body['user']);

    await _save(
      token: response.body['token'],
      refreshToken: response.body['refreshToken'],
      user: user,
    );
  }

  Future<void> _save({
    required String token,
    required String refreshToken,
    required User user,
  }) async {
    await Future.wait([
      _storageAdapter.save(tokenKey, token),
      _storageAdapter.save(_refreshTokenKey, refreshToken),
      _storageAdapter.save(_userKey, jsonEncode(UserDto.toJson(user))),
    ]);
  }
}
