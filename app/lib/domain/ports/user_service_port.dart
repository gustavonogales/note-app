import '../domain.dart';

abstract interface class UserServicePort {
  Future<User> signIn({
    required String email,
    required String password,
  });

  Future<void> signOut();

  Future<User> signUp({
    required String name,
    required String email,
    required String password,
  });

  Future<User> update({
    required String name,
    required String email,
    required String password,
  });

  User? signedUser();

  Future<void> refreshToken();
}
