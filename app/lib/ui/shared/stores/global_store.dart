// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

import 'auth_store.dart';
import 'theme_store.dart';

part 'global_store.g.dart';

@singleton
class GlobalStore = _GlobalStoreBase with _$GlobalStore;

abstract class _GlobalStoreBase with Store {
  final ThemeStore theme;
  final AuthStore auth;

  _GlobalStoreBase(this.theme, this.auth);
}
