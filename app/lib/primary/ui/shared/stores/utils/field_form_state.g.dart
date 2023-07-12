// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'field_form_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FieldFormState on _FieldFormStateBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_FieldFormStateBase.hasError'))
          .value;

  late final _$valueAtom =
      Atom(name: '_FieldFormStateBase.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_FieldFormStateBase.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$_FieldFormStateBaseActionController =
      ActionController(name: '_FieldFormStateBase', context: context);

  @override
  void setValue(String data) {
    final _$actionInfo = _$_FieldFormStateBaseActionController.startAction(
        name: '_FieldFormStateBase.setValue');
    try {
      return super.setValue(data);
    } finally {
      _$_FieldFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validate() {
    final _$actionInfo = _$_FieldFormStateBaseActionController.startAction(
        name: '_FieldFormStateBase.validate');
    try {
      return super.validate();
    } finally {
      _$_FieldFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void compareTo(String data, {required String errorMessage}) {
    final _$actionInfo = _$_FieldFormStateBaseActionController.startAction(
        name: '_FieldFormStateBase.compareTo');
    try {
      return super.compareTo(data, errorMessage: errorMessage);
    } finally {
      _$_FieldFormStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
error: ${error},
hasError: ${hasError}
    ''';
  }
}
