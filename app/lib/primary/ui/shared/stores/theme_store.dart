import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/secondary/secondary.dart';
part 'theme_store.g.dart';

@singleton
class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  static const String themeKey = 'theme';

  late final StoragePort _storagePort;

  _ThemeStoreBase(StoragePort storagePort) {
    _storagePort = storagePort;
    useLightMode = _storagePort.get(themeKey) == 'true';
  }

  @observable
  bool useLightMode = false;

  @computed
  ThemeMode get themeMode => useLightMode ? ThemeMode.light : ThemeMode.dark;

  @action
  void toggleTheme() {
    useLightMode = !useLightMode;
    _storagePort.save(themeKey, useLightMode.toString());
  }
}
