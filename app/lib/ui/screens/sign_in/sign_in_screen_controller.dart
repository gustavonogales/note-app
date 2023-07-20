// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:note_app/ui/stores/utils/field_form_state.dart';

import '../../stores/user_store.dart';

part 'sign_in_screen_controller.g.dart';

class SignInScreenController = _SignInScreenControllerBase
    with _$SignInScreenController;

abstract class _SignInScreenControllerBase with Store {
  final UserStore _parentStore;

  _SignInScreenControllerBase(this._parentStore);

  @observable
  bool loading = false;

  @observable
  FieldFormState email = FieldFormState(
    validate: (value) {
      return value.isEmpty ? 'E-mail is required' : '';
    },
    validateOnChange: true,
  );

  @observable
  FieldFormState password = FieldFormState(
    validate: (value) {
      return value.isEmpty ? 'Password is required' : '';
    },
    validateOnChange: true,
  );

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
      errorText = 'Invalid email/password';
    } finally {
      loading = false;
    }
  }
}
