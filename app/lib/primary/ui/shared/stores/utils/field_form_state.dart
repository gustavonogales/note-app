import 'package:mobx/mobx.dart';

part 'field_form_state.g.dart';

class FieldFormState = _FieldFormStateBase with _$FieldFormState;

abstract class _FieldFormStateBase with Store {
  final bool validateOnChange;
  late final String Function(String value)? _validate;

  _FieldFormStateBase({
    String Function(String value)? validate,
    this.validateOnChange = false,
  }) {
    _validate = validate;
  }

  @observable
  String value = '';

  @observable
  String error = '';

  @computed
  bool get hasError => error.isNotEmpty;

  @action
  void setValue(String data) {
    value = data;
    if (validateOnChange) validate();
  }

  @action
  void validate() {
    if (_validate != null) {
      error = _validate!(value);
    }
  }

  @action
  void compareTo(String data, {required String errorMessage}) {
    if (value != data) {
      error = errorMessage;
    }
  }
}
