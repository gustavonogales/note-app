import 'package:mobx/mobx.dart';

part 'field_form_state.g.dart';

class FieldFormState = _FieldFormStateBase with _$FieldFormState;

abstract class _FieldFormStateBase with Store {
  final bool validateOnChange;
  final String Function(String value) _validate;

  _FieldFormStateBase(this._validate, {this.validateOnChange = false});

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
  void validate() => error = _validate(value);

  @action
  void compareTo(String data, {required String errorMessage}) {
    if (value != data) {
      error = errorMessage;
    }
  }
}
