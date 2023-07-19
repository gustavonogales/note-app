// ignore_for_file: library_private_types_in_public_api

import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';

import '../shared.dart';

part 'auth_store.g.dart';

@singleton
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  late final UserServicePort _userService;

  _AuthStoreBase(this._userService) {
    final signedUser = _userService.signedUser();
    if (signedUser != null) setUser(signedUser);

    reaction((_) => user, (user) {
      if (user == null) {
        GoRouter.of(navigationKey.currentState!.context).go(Routes.signIn);
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
}
