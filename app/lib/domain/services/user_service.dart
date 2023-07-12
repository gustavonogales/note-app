import 'package:injectable/injectable.dart';
import 'package:note_app/domain/models/user.dart';
import 'package:note_app/secondary/secondary.dart';

import '../ports/user_service_port.dart';
import 'dtos/user.dto.dart';

@Singleton(as: UserServicePort)
final class UserService implements UserServicePort {
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
    _storageAdapter.save('token', response.body['token']);

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
}
