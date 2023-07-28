// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/adapter/adapter.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/stores/user_store.dart';
import 'package:note_app/ui/stores/utils/field_form_state.dart';

part 'sign_up_screen_controller.g.dart';

enum SignUpStatus {
  success,
  error,
  idle;

  bool get isSuccess => this == SignUpStatus.success;
  bool get isError => this == SignUpStatus.error;
}

class SignUpScreenController = _SignUpScreenControllerBase
    with _$SignUpScreenController;

abstract class _SignUpScreenControllerBase with Store {
  final UserStore _parentStore;

  BuildContext? get currentContext => _parentStore.uiStore.currentContext;

  _SignUpScreenControllerBase(this._parentStore) {
    fullName = FieldFormState(validate: (value) {
      switch (value) {
        case '':
          return currentContext!.l10n.nameIsRequired;
        default:
          return '';
      }
    });

    email = FieldFormState(validate: (value) {
      switch (value) {
        case '':
          return currentContext!.l10n.emailIsRequired;
        default:
          return '';
      }
    });

    password = FieldFormState(validate: (value) {
      switch (value) {
        case '':
          return currentContext!.l10n.passwordIsRequired;
        case String value when value.length < 6:
          return currentContext!.l10n.passwordMinLengthIs(6);
        default:
          return '';
      }
    });

    confirmPassword = FieldFormState(validate: (value) {
      switch (value) {
        case '':
          return currentContext!.l10n.passwordIsRequired;
        case String value when value.length < 6:
          return currentContext!.l10n.passwordMinLengthIs(6);
        default:
          return '';
      }
    });
  }

  @observable
  SignUpStatus status = SignUpStatus.idle;

  @observable
  String statusMessage = '';

  @observable
  bool loading = false;

  FieldFormState fullName = FieldFormState();

  FieldFormState email = FieldFormState();

  FieldFormState password = FieldFormState();

  FieldFormState confirmPassword = FieldFormState();

  @computed
  bool get hasError => fullName.hasError || email.hasError || password.hasError;

  @action
  Future<void> signUp() async {
    loading = true;
    status = SignUpStatus.idle;

    try {
      fullName.validate();
      email.validate();
      password.validate();
      confirmPassword.validate();
      confirmPassword.compareTo(
        password.value,
        errorMessage: currentContext?.l10n.passwordsNotMatch ?? '',
      );

      if (hasError) return;

      await _parentStore.signUp(
        name: fullName.value,
        email: email.value,
        password: password.value,
      );

      status = SignUpStatus.success;
      statusMessage = currentContext?.l10n.userCreatedMessage ?? '';
    } on HttpSendException catch (e) {
      statusMessage = e.message;
      status = SignUpStatus.error;
    } catch (_) {
      statusMessage = currentContext?.l10n.unexpectedErrorMessage ?? '';
      status = SignUpStatus.error;
    } finally {
      loading = false;
    }
  }
}
