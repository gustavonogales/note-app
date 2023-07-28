// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';

import '../routes/routes.dart';
import '../screens/sign_in/sign_in_screen_controller.dart';
import '../screens/sign_up/sign_up_screen_controller.dart';
import 'ui_store.dart';

part 'user_store.g.dart';

@singleton
class UserStore = _UserStoreBase with _$UserStore;

abstract class _UserStoreBase with Store {
  late SignInScreenController signInController;
  late SignUpScreenController signUpController;
  final UserServicePort _userService;
  final UiStore uiStore;

  _UserStoreBase(this._userService, this.uiStore) {
    final signedUser = _userService.signedUser();

    signInController = SignInScreenController(this as UserStore);
    signUpController = SignUpScreenController(this as UserStore);

    if (signedUser != null) setUser(signedUser);

    reaction((_) => user, (user) {
      if (user == null && uiStore.currentContext != null) {
        GoRouter.of(uiStore.currentContext!).go(Routes.signIn);
      }
    });
  }

  @observable
  User? user;

  @computed
  bool get isSignedIn => user != null;

  @action
  void setUser(User value) {
    user = value;
  }

  @action
  void signOut() {
    _userService.signOut();
    user = null;
  }

  Future<void> signIn({required String email, required String password}) async {
    user = await _userService.signIn(email: email, password: password);
  }

  Future<void> update({
    required String name,
    required String email,
    required String password,
  }) async {
    user = await _userService.update(
      name: name,
      email: email,
      password: password,
    );
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String password,
  }) =>
      _userService.signUp(
        name: name,
        email: email,
        password: password,
      );

  Future<void> updateAvatar({
    required String filename,
    required File file,
  }) async {
    user = await _userService.updateAvatar(
      filename: filename,
      file: file,
    );
  }

  Future<void> delete() => _userService.delete();
}
