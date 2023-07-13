import 'package:mobx/mobx.dart';
import 'package:note_app/container.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/primary/ui/shared/shared.dart';

part 'note_controller.g.dart';

class NoteController = _NoteControllerBase with _$NoteController;

abstract class _NoteControllerBase with Store {
  late final UserServicePort _userService;

  _NoteControllerBase([ViewNote? data]) {
    _userService = locator();
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

  @observable
  FieldFormState title = FieldFormState();

  @observable
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
