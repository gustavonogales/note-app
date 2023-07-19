// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:note_app/ui/shared/shared.dart';

part 'note_controller.g.dart';

class NoteController = _NoteControllerBase with _$NoteController;

abstract class _NoteControllerBase with Store {
  _NoteControllerBase([ViewNote? data]) {
    if (data != null) note = data;
    if (note.title.isEmpty && note.text.isEmpty) {
      setEditMode(true);
    }
  }

  @observable
  bool loading = false;

  @observable
  bool editMode = false;

  @observable
  bool colorPickerVisible = false;

  @observable
  ViewNote note = ViewNote();

  FieldFormState title = FieldFormState();

  FieldFormState text = FieldFormState();

  @action
  void setNote(ViewNote value) {
    note = value;
    title.setValue(value.title);
    text.setValue(value.text);
  }

  @action
  void setEditMode(bool value) => editMode = value;

  @action
  void setColorPickerVisible(bool value) => colorPickerVisible = value;
}
