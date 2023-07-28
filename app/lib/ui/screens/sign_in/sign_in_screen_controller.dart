// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/stores/utils/field_form_state.dart';

import '../../stores/user_store.dart';

part 'sign_in_screen_controller.g.dart';

class SignInScreenController = _SignInScreenControllerBase
    with _$SignInScreenController;

abstract class _SignInScreenControllerBase with Store {
  final UserStore _parentStore;

  _SignInScreenControllerBase(this._parentStore) {
    email = FieldFormState(
      validate: (value) {
        return value.isEmpty
            ? _parentStore.uiStore.currentContext!.l10n.emailIsRequired
            : '';
      },
      validateOnChange: true,
    );
    password = FieldFormState(
      validate: (value) {
        return value.isEmpty
            ? _parentStore.uiStore.currentContext!.l10n.passwordIsRequired
            : '';
      },
      validateOnChange: true,
    );
  }

  @observable
  bool loading = false;

  @observable
  FieldFormState email = FieldFormState();

  @observable
  FieldFormState password = FieldFormState();

  @computed
  bool get hasError => email.hasError || password.hasError;

  @observable
  String? errorText;

  @action
  Future<void> signIn() async {
    try {
      errorText = null;
      loading = true;

      email.validate();
      password.validate();

      if (hasError) throw Error();

      await _parentStore.signIn(
        email: email.value,
        password: password.value,
      );
    } catch (e) {
      errorText =
          _parentStore.uiStore.currentContext?.l10n.invalidEmailOrPassword;
    } finally {
      loading = false;
    }
  }
}
