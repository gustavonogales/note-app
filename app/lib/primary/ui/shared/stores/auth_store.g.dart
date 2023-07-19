// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$isSignedInComputed;

  @override
  bool get isSignedIn =>
      (_$isSignedInComputed ??= Computed<bool>(() => super.isSignedIn,
              name: '_AuthStoreBase.isSignedIn'))
          .value;

  late final _$userAtom = Atom(name: '_AuthStoreBase.user', context: context);

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

  late final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase', context: context);

  @override
  void setUser(User value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void signOut() {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.signOut');
    try {
      return super.signOut();
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isSignedIn: ${isSignedIn}
    ''';
  }
}
