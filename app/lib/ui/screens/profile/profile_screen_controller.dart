// ignore_for_file: library_private_types_in_public_api

import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/stores/utils/field_form_state.dart';

import '../../stores/user_store.dart';
part 'profile_screen_controller.g.dart';

class ProfileScreenController = _ProfileScreenControllerBase
    with _$ProfileScreenController;

abstract class _ProfileScreenControllerBase with Store {
  final UserStore _parentStore;

  BuildContext? get currentContext => _parentStore.uiStore.currentContext;

  _ProfileScreenControllerBase(this._parentStore) {
    name = FieldFormState(
      validate: (value) {
        if (value.isEmpty) return currentContext!.l10n.nameIsRequired;
        return '';
      },
      validateOnChange: true,
    );

    email = FieldFormState(
      validate: (value) {
        if (value.isEmpty) return currentContext!.l10n.emailIsRequired;
        return '';
      },
      validateOnChange: true,
    );

    password = FieldFormState(
      validate: (value) {
        switch (value) {
          case '':
            return currentContext!.l10n.passwordIsRequired;
          case String value when value.length < 6:
            return currentContext!.l10n.passwordMinLengthIs(6);
          default:
            return '';
        }
      },
      validateOnChange: true,
    );

    confirmPassword = FieldFormState(
      validateOnChange: true,
      compareField: password,
      compare: (compareValue, value) =>
          compareValue != value ? currentContext!.l10n.passwordsNotMatch : '',
    );

    name.setValue(_parentStore.user?.name ?? '');
    email.setValue(_parentStore.user?.email ?? '');
  }

  FieldFormState name = FieldFormState();

  FieldFormState email = FieldFormState();

  FieldFormState password = FieldFormState();

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
      messageText = currentContext?.l10n.profileUpdatedMessage;
    } catch (_) {
      messageText = currentContext?.l10n.profileErrorMessage;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> delete() async {
    try {
      isLoading = true;
      messageText = null;
      successfull = false;

      await _parentStore.delete();

      successfull = true;
      messageText = currentContext?.l10n.deleteYourAccountSuccessMessage;

      _parentStore.user = null;
    } catch (_) {
      messageText = currentContext?.l10n.deleteYourAccountErrorMessage;
    } finally {
      isLoading = false;
    }
  }
}
