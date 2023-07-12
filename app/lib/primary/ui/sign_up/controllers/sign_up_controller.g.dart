// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignUpController on _SignUpControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_SignUpControllerBase.hasError'))
          .value;

  late final _$statusAtom =
      Atom(name: '_SignUpControllerBase.status', context: context);

  @override
  SignUpStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(SignUpStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$statusMessageAtom =
      Atom(name: '_SignUpControllerBase.statusMessage', context: context);

  @override
  String get statusMessage {
    _$statusMessageAtom.reportRead();
    return super.statusMessage;
  }

  @override
  set statusMessage(String value) {
    _$statusMessageAtom.reportWrite(value, super.statusMessage, () {
      super.statusMessage = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_SignUpControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$signUpAsyncAction =
      AsyncAction('_SignUpControllerBase.signUp', context: context);

  @override
  Future<void> signUp() {
    return _$signUpAsyncAction.run(() => super.signUp());
  }

  @override
  String toString() {
    return '''
status: ${status},
statusMessage: ${statusMessage},
loading: ${loading},
hasError: ${hasError}
    ''';
  }
}
