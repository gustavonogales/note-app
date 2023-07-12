import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import 'auth_store.dart';
import 'theme_store.dart';

part 'global_store.g.dart';

@singleton
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  ThemeStore theme = ThemeStore();
  AuthStore auth = AuthStore();
}
