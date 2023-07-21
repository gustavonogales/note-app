// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileScreenController on _ProfileScreenControllerBase, Store {
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError =>
      (_$hasErrorComputed ??= Computed<bool>(() => super.hasError,
              name: '_ProfileScreenControllerBase.hasError'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_ProfileScreenControllerBase.isLoading', context: context);

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
      Atom(name: '_ProfileScreenControllerBase.messageText', context: context);

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
      Atom(name: '_ProfileScreenControllerBase.successfull', context: context);

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

  late final _$avatarAtom =
      Atom(name: '_ProfileScreenControllerBase.avatar', context: context);

  @override
  Uint8List? get avatar {
    _$avatarAtom.reportRead();
    return super.avatar;
  }

  @override
  set avatar(Uint8List? value) {
    _$avatarAtom.reportWrite(value, super.avatar, () {
      super.avatar = value;
    });
  }

  late final _$updateProfileAsyncAction = AsyncAction(
      '_ProfileScreenControllerBase.updateProfile',
      context: context);

  @override
  Future<void> updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
  }

  late final _$_ProfileScreenControllerBaseActionController =
      ActionController(name: '_ProfileScreenControllerBase', context: context);

  @override
  dynamic setAvatar(Uint8List value) {
    final _$actionInfo = _$_ProfileScreenControllerBaseActionController
        .startAction(name: '_ProfileScreenControllerBase.setAvatar');
    try {
      return super.setAvatar(value);
    } finally {
      _$_ProfileScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
messageText: ${messageText},
successfull: ${successfull},
avatar: ${avatar},
hasError: ${hasError}
    ''';
  }
}
