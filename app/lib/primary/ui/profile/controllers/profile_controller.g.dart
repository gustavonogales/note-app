// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on _ProfileControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_ProfileControllerBase.hasError'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_ProfileControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$messageTextAtom =
      Atom(name: '_ProfileControllerBase.messageText', context: context);

  @override
  String? get messageText {
    _$messageTextAtom.reportRead();
    return super.messageText;
  }

  @override
  set messageText(String? value) {
    _$messageTextAtom.reportWrite(value, super.messageText, () {
      super.messageText = value;
    });
  }

  late final _$successfullAtom =
      Atom(name: '_ProfileControllerBase.successfull', context: context);

  @override
  bool get successfull {
    _$successfullAtom.reportRead();
    return super.successfull;
  }

  @override
  set successfull(bool value) {
    _$successfullAtom.reportWrite(value, super.successfull, () {
      super.successfull = value;
    });
  }

  late final _$userAtom =
      Atom(name: '_ProfileControllerBase.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$updateProfileAsyncAction =
      AsyncAction('_ProfileControllerBase.updateProfile', context: context);

  @override
  Future<void> updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
messageText: ${messageText},
successfull: ${successfull},
user: ${user},
hasError: ${hasError}
    ''';
  }
}
