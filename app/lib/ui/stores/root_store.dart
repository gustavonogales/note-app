// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/domain.dart';

import 'user_store.dart';
import 'note_store.dart';
import 'ui_store.dart';

part 'root_store.g.dart';

@singleton
class RootStore = _RootStoreBase with _$RootStore;

abstract class _RootStoreBase with Store {
  final UserServicePort _userServicePort;
  final NoteServicePort _noteServicePort;
  final AppServicePort _appServicePort;

  _RootStoreBase(
    this._userServicePort,
    this._noteServicePort,
    this._appServicePort,
  ) {
    uiStore = UiStore(_appServicePort);
    userStore = UserStore(_userServicePort, uiStore);
    noteStore = NoteStore(_noteServicePort, uiStore);
  }

  late final UiStore uiStore;
  late final UserStore userStore;
  late final NoteStore noteStore;

  String appVersion() => _appServicePort.appVersion;
}
