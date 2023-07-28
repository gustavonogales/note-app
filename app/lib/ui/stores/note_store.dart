// ignore_for_file: library_private_types_in_public_api

import 'dart:math' show Random;
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/ui/extensions/extensions.dart';
import 'package:note_app/ui/utils/utils.dart';

import '../screens/note/note_screen_controller.dart';
import '../view_models/note.dart';
import 'ui_store.dart';
part 'note_store.g.dart';

@singleton
class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  late final NoteScreenController noteController;
  final NoteServicePort _noteServicePort;
  final UiStore _uiStore;

  _NoteStoreBase(this._noteServicePort, this._uiStore) {
    noteController = NoteScreenController(this as NoteStore);
  }

  BuildContext? get currentContext => _uiStore.currentContext;

  @computed
  bool get deleteMode => notes.where((note) => note.selected).isNotEmpty;

  @observable
  bool loading = false;

  @observable
  String? errorText;

  @observable
  ObservableList<ViewNote> notes = ObservableList<ViewNote>();

  @observable
  ObservableList<ViewNote> shouldDeleteNotes = ObservableList<ViewNote>();

  @observable
  ObservableList<Layout> layout = ObservableList<Layout>();

  ViewNote? selectedNote;

  @action
  setSelectedNote(ViewNote? note) {
    noteController.reset();
    selectedNote = note;
  }

  List<Layout> randomLayout() =>
      cardLayouts[Random().nextInt(cardLayouts.length)];

  @action
  Future<void> getAllNotes({bool refreshing = false}) async {
    errorText = null;

    try {
      loading = !refreshing;

      final data = await _noteServicePort.getAll();

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
      errorText = currentContext?.l10n.unexpectedErrorMessage;
    } finally {
      loading = false;
    }
  }

  Future<void> update(ViewNote note) => _noteServicePort.update(note.toModel());

  Future<ViewNote> create(ViewNote note) async {
    final createdNote = await _noteServicePort.create(note.toModel());
    if (layout.length <= notes.length + 1) {
      layout.addAll(layout);
    }
    final viewNote = ViewNote.fromModel(createdNote);
    notes.add(viewNote);
    return viewNote;
  }

  Future<void> delete() async {
    try {
      final ids =
          notes.where((note) => note.selected).map((note) => note.id).toList();

      if (ids.isNotEmpty) {
        await _noteServicePort.deleteMany(ids);
        notes.removeWhere((note) => note.selected);
      }
    } catch (_) {
      errorText = currentContext?.l10n.unexpectedErrorMessage;
    }
  }
}
