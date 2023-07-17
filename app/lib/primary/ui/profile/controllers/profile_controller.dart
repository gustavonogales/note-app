import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

import '../../../../container.dart';
part 'profile_controller.g.dart';

class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  late final UserServicePort _userService;

  _ProfileControllerBase(User? user) {
    _userService = locator();
    if (user != null) {
      name.setValue(user.name);
      email.setValue(user.email);
    }

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
  User? user;

  @action
  Future<void> updateProfile() async {
    if (hasError) return;

    try {
      messageText = null;
      successfull = false;
      isLoading = true;

      user = await _userService.update(
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
