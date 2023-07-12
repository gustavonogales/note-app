import 'dart:developer';

import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late final NoteServicePort _noteService;

  @observable
  ObservableList<Note> notes = ObservableList<Note>();

  _HomeControllerBase() {
    _noteService = locator();
  }

  @observable
  bool loading = false;

  @action
  Future<void> getAllNotes() async {
    try {
      loading = true;
      final data = await _noteService.getAll();
      notes = ObservableList<Note>();
      notes.addAll(data);
    } catch (e) {
      log(e.toString());
    } finally {
      loading = false;
    }
  }
}
