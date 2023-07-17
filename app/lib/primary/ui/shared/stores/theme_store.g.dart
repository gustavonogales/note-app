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

  late final _$useLightModeAtom =
      Atom(name: '_ThemeStoreBase.useLightMode', context: context);

  @override
  bool get useLightMode {
    _$useLightModeAtom.reportRead();
    return super.useLightMode;
  }

  @override
  set useLightMode(bool value) {
    _$useLightModeAtom.reportWrite(value, super.useLightMode, () {
      super.useLightMode = value;
    });
  }

  late final _$_ThemeStoreBaseActionController =
      ActionController(name: '_ThemeStoreBase', context: context);

  @override
  void toggleTheme() {
    final _$actionInfo = _$_ThemeStoreBaseActionController.startAction(
        name: '_ThemeStoreBase.toggleTheme');
    try {
      return super.toggleTheme();
    } finally {
      _$_ThemeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
useLightMode: ${useLightMode},
themeMode: ${themeMode}
    ''';
  }
}
