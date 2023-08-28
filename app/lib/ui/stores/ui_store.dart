// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';

part 'ui_store.g.dart';

enum ScreenSize {
  mobile,
  tablet,
  desktop;
}

@singleton
class UiStore = _UiStoreBase with _$UiStore;

abstract class _UiStoreBase with Store {
  final navigationKey = GlobalKey<NavigatorState>();
  final AppServicePort _appServicePort;

  _UiStoreBase(this._appServicePort) {
    useLightMode = _appServicePort.isUsingLightTheme();
  }

  BuildContext? get currentContext => navigationKey.currentState?.context;

  ScreenSize screenSize(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (size.width < 850) {
      return ScreenSize.mobile;
    } else if (size.width >= 850 && size.width < 1100) {
      return ScreenSize.tablet;
    } else {
      return ScreenSize.desktop;
    }
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
