import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

part 'sign_in_controller.g.dart';

class SignInController = _SignInControllerBase with _$SignInController;

abstract class _SignInControllerBase with Store {
  late final UserServicePort _userService;

  _SignInControllerBase() {
    _userService = locator();
  }

  @observable
  bool loading = false;

  @observable
  User? user;

  @observable
  FieldFormState email = FieldFormState(
    (value) {
      return value.isEmpty ? 'E-mail is required' : '';
    },
    validateOnChange: true,
  );

  @observable
  FieldFormState password = FieldFormState(
    (value) {
      return value.isEmpty ? 'Password is required' : '';
    },
    validateOnChange: true,
  );

  @computed
  bool get hasError => email.hasError || password.hasError;

  @action
  void setUser(User value) => user = value;

  @action
  Future<void> signIn() async {
    try {
      loading = true;

      email.validate();
      password.validate();

      if (hasError) throw Error();

      final data = await _userService.signIn(
        email: email.value,
        password: password.value,
      );
      user = data;
    } catch (e) {
    } finally {
      loading = false;
    }
  }
}
