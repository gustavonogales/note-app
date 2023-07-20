// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignInScreenController on _SignInScreenControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_SignInScreenControllerBase.hasError'))
          .value;

  late final _$loadingAtom =
      Atom(name: '_SignInScreenControllerBase.loading', context: context);

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

  late final _$emailAtom =
      Atom(name: '_SignInScreenControllerBase.email', context: context);

  @override
  FieldFormState get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(FieldFormState value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_SignInScreenControllerBase.password', context: context);

  @override
  FieldFormState get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(FieldFormState value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_SignInScreenControllerBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$signInAsyncAction =
      AsyncAction('_SignInScreenControllerBase.signIn', context: context);

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
email: ${email},
password: ${password},
errorText: ${errorText},
hasError: ${hasError}
    ''';
  }
}
