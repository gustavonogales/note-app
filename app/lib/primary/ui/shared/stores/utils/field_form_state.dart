import 'package:mobx/mobx.dart';

part 'field_form_state.g.dart';

class FieldFormState = _FieldFormStateBase with _$FieldFormState;

abstract class _FieldFormStateBase with Store {
  final bool validateOnChange;
  late final String Function(String value)? _validate;
  late final FieldFormState? _compareField;
  final String Function(String compareValue, String value)? compare;

  _FieldFormStateBase({
    String Function(String value)? validate,
    FieldFormState? compareField,
    this.compare,
    this.validateOnChange = false,
  }) {
    if (compareField != null || compare != null) {
      assert(
        compareField != null && compare != null,
        'Compare function needs compareField',
      );
      _compareField = compareField;

      reaction(
        (_) => compareField!.value,
        (compareValue) {
          compareWith();
        },
      );
    }
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
    if (validateOnChange) {
      validate();
      if (compare != null) {
        compareWith();
      }
    }
  }

  @action
  void compareWith() {
    if (compare != null) {
      error = compare?.call(_compareField!.value, value) ?? error;
    }
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
