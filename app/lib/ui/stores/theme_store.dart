// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';

part 'theme_store.g.dart';

@singleton
class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  final AppServicePort _appServicePort;

  _ThemeStoreBase(this._appServicePort) {
    useLightMode = _appServicePort.isUsingLightTheme();
  }

  @observable
  bool useLightMode = false;

  @computed
  ThemeMode get themeMode => useLightMode ? ThemeMode.light : ThemeMode.dark;

  @action
  void toggleTheme() {
    useLightMode = !useLightMode;
    _appServicePort.usingLightTheme(useLightMode);
  }
}
