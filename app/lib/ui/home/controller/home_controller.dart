// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/ui/shared/shared.dart';

import '../layouts/layouts.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  late final NoteServicePort _noteService;

  List<Layout> randomLayout() => layouts[Random().nextInt(layouts.length)];

  @observable
  ObservableList<ViewNote> notes = ObservableList<ViewNote>();

  @observable
  ObservableList<Layout> layout = ObservableList<Layout>();

  _HomeControllerBase() {
    _noteService = locator();
  }

  @observable
  bool loading = false;

  @observable
  bool isEmpty = false;

  @observable
  String? errorText;

  @action
  Future<void> getAllNotes() async {
    errorText = null;

    try {
      loading = true;

      final data = await _noteService.getAll();

      final definedLayout = randomLayout();
      layout = ObservableList.of(definedLayout);

      while (data.length > layout.length) {
        layout.addAll(definedLayout);
      }

      notes.replaceRange(
        0,
        notes.length,
        data.map((note) => ViewNote.fromModel(note)),
      );
    } catch (_) {
      errorText = 'An error occurred, please try again';
    } finally {
      loading = false;
    }
  }
}
