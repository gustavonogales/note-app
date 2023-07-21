// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/ui/stores/stores.dart';
import 'package:note_app/ui/utils/utils.dart';

import '../../view_models/note.dart';

part 'note_screen_controller.g.dart';

class NoteScreenController = _NoteScreenControllerBase
    with _$NoteScreenController;

abstract class _NoteScreenControllerBase with Store {
  late final NoteStore _parentStore;
  final titleController = TextEditingController();
  final textController = TextEditingController();

  _NoteScreenControllerBase(this._parentStore);

  @observable
  bool isNewNote = true;

  @observable
  bool editMode = false;

  @observable
  bool colorPickerVisible = false;

  @observable
  ViewNote note = ViewNote();

  @observable
  String messageText = '';

  void reset() {
    isNewNote = true;
    editMode = false;
    colorPickerVisible = false;
    note = ViewNote();
    messageText = '';
    titleController.clear();
    textController.clear();
  }

  @action
  void setNote(ViewNote? data) {
    if (data != null) {
      note = data;
      titleController.text = data.title;
      textController.text = data.text;
      isNewNote = false;
    } else {
      setEditMode(true);
    }
  }

  @action
  void setEditMode(bool value) => editMode = value;

  @action
  void setColorPickerVisible(bool value) => colorPickerVisible = value;

  @action
  void cancel() {
    editMode = false;
    titleController.text = note.title;
    textController.text = note.text;
  }

  @action
  void changeColor(NoteColor color) {
    note.setColor(color);
    if (!isNewNote) _parentStore.update(note);
  }

  @action
  Future<void> save() async {
    try {
      editMode = false;
      note.setTitle(titleController.text);
      note.setText(textController.text);
      note.updatedAt = DateTime.now().toIso8601String();

      if (isNewNote) {
        final createdNote = await _parentStore.create(note);
        setNote(createdNote);
      } else {
        await _parentStore.update(note);
      }
    } catch (_) {
      messageText = isNewNote
          ? 'Error to create new note, try again'
          : 'Error while saving changes, try again.';
    }
  }
}
