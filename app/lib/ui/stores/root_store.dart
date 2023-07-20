// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';
import 'package:note_app/domain/domain.dart';

import 'user_store.dart';
import 'note_store.dart';
import 'theme_store.dart';

part 'root_store.g.dart';

@singleton
class RootStore = _RootStoreBase with _$RootStore;

abstract class _RootStoreBase with Store {
  final UserServicePort _userServicePort;
  final NoteServicePort _noteServicePort;
  final ThemeServicePort _themeServicePort;

  _RootStoreBase(
    this._userServicePort,
    this._noteServicePort,
    this._themeServicePort,
  ) {
    themeStore = ThemeStore(_themeServicePort);
    userStore = UserStore(_userServicePort);
    noteStore = NoteStore(_noteServicePort);
  }

  late final ThemeStore themeStore;
  late final UserStore userStore;
  late final NoteStore noteStore;
}
