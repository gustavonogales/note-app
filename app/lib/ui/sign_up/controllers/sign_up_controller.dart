// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/ui/shared/shared.dart';
import 'package:note_app/adapter/adapter.dart';

part 'sign_up_controller.g.dart';

enum SignUpStatus {
  success,
  error,
  idle;

  bool get isSuccess => this == SignUpStatus.success;
  bool get isError => this == SignUpStatus.error;
}

class SignUpController = _SignUpControllerBase with _$SignUpController;

abstract class _SignUpControllerBase with Store {
  late UserServicePort _userService;

  _SignUpControllerBase() {
    _userService = locator();
  }

  @observable
  SignUpStatus status = SignUpStatus.idle;

  @observable
  String statusMessage = '';

  @observable
  bool loading = false;

  FieldFormState fullName = FieldFormState(validate: (value) {
    switch (value) {
      case '':
        return 'Name is required';
      default:
        return '';
    }
  });

  FieldFormState email = FieldFormState(validate: (value) {
    switch (value) {
      case '':
        return 'E-mail is required';
      default:
        return '';
    }
  });

  FieldFormState password = FieldFormState(validate: (value) {
    switch (value) {
      case '':
        return 'Password is required';
      case String value when value.length < 6:
        return 'Password must have 6 or more characters';
      default:
        return '';
    }
  });

  FieldFormState confirmPassword = FieldFormState(validate: (value) {
    switch (value) {
      case '':
        return 'Password is required';
      case String value when value.length < 6:
        return 'Password must have 6 or more characters';
      default:
        return '';
    }
  });

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
        errorMessage: 'Passwords not match!',
      );

      if (hasError) return;

      await _userService.signUp(
        name: fullName.value,
        email: email.value,
        password: password.value,
      );

      status = SignUpStatus.success;
      statusMessage = 'User created successfully';
    } on HttpSendException catch (e) {
      statusMessage = e.message;
      status = SignUpStatus.error;
    } catch (_) {
      statusMessage = 'Unexpected error, please try again';
      status = SignUpStatus.error;
    } finally {
      loading = false;
    }
  }
}
