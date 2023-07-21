// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:mobx/mobx.dart';
import 'package:note_app/ui/stores/utils/field_form_state.dart';

import '../../stores/user_store.dart';
part 'profile_screen_controller.g.dart';

class ProfileScreenController = _ProfileScreenControllerBase
    with _$ProfileScreenController;

abstract class _ProfileScreenControllerBase with Store {
  final UserStore _parentStore;

  _ProfileScreenControllerBase(this._parentStore) {
    name.setValue(_parentStore.user?.name ?? '');
    email.setValue(_parentStore.user?.email ?? '');
    confirmPassword = FieldFormState(
      validateOnChange: true,
      compareField: password,
      compare: (compareValue, value) =>
          compareValue != value ? 'Passwords not match!' : '',
    );
  }

  FieldFormState name = FieldFormState(
    validate: (value) {
      if (value.isEmpty) return 'Name is required';
      return '';
    },
    validateOnChange: true,
  );

  FieldFormState email = FieldFormState(
    validate: (value) {
      if (value.isEmpty) return 'Email is required';
      return '';
    },
    validateOnChange: true,
  );

  FieldFormState password = FieldFormState(
    validate: (value) {
      switch (value) {
        case '':
          return 'Password is required';
        case String value when value.length < 6:
          return 'Password must have 6 or more characters';
        default:
          return '';
      }
    },
    validateOnChange: true,
  );

  FieldFormState confirmPassword = FieldFormState(validateOnChange: true);

  @computed
  bool get hasError =>
      name.hasError ||
      email.hasError ||
      password.hasError ||
      confirmPassword.hasError;

  @observable
  bool isLoading = false;

  @observable
  String? messageText;

  @observable
  bool successfull = false;

  @observable
  File? avatar;

  @action
  setAvatar(File file) {
    avatar = file;
    _parentStore.updateAvatar(filename: 'avatar', file: file);
  }

  @action
  Future<void> updateProfile() async {
    if (hasError) return;

    try {
      messageText = null;
      successfull = false;
      isLoading = true;

      await _parentStore.update(
        name: name.value,
        email: email.value,
        password: password.value,
      );

      successfull = true;
      messageText = 'Profile updated';
    } catch (_) {
      messageText = 'Error updating profile, try again';
    } finally {
      isLoading = false;
    }
  }
}
