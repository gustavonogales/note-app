import 'package:mobx/mobx.dart';

import '../../../../domain/models/user.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  bool isLoggedIn = false;

  @observable
  User? user;

  @action
  void setUser(User value) {
    isLoggedIn = true;
    user = value;
  }

  @action
  void signOut() {
    isLoggedIn = false;
    user = null;
  }
}
