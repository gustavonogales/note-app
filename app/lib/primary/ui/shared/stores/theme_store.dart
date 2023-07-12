import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'theme_store.g.dart';

class ThemeStore = _ThemeStoreBase with _$ThemeStore;

abstract class _ThemeStoreBase with Store {
  @observable
  bool useDarkMode = true;

  @computed
  ThemeMode get themeMode => useDarkMode ? ThemeMode.dark : ThemeMode.light;

  @action
  void setUseDarkMode(bool use) => useDarkMode = use;
}
