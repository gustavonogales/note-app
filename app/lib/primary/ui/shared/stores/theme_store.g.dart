// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ThemeStore on _ThemeStoreBase, Store {
  Computed<ThemeMode>? _$themeModeComputed;

  @override
  ThemeMode get themeMode =>
      (_$themeModeComputed ??= Computed<ThemeMode>(() => super.themeMode,
              name: '_ThemeStoreBase.themeMode'))
          .value;

  late final _$useDarkModeAtom =
      Atom(name: '_ThemeStoreBase.useDarkMode', context: context);

  @override
  bool get useDarkMode {
    _$useDarkModeAtom.reportRead();
    return super.useDarkMode;
  }

  @override
  set useDarkMode(bool value) {
    _$useDarkModeAtom.reportWrite(value, super.useDarkMode, () {
      super.useDarkMode = value;
    });
  }

  late final _$_ThemeStoreBaseActionController =
      ActionController(name: '_ThemeStoreBase', context: context);

  @override
  void setUseDarkMode(bool use) {
    final _$actionInfo = _$_ThemeStoreBaseActionController.startAction(
        name: '_ThemeStoreBase.setUseDarkMode');
    try {
      return super.setUseDarkMode(use);
    } finally {
      _$_ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
useDarkMode: ${useDarkMode},
themeMode: ${themeMode}
    ''';
  }
}
