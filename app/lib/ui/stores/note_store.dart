import 'dart:math';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:note_app/domain/domain.dart';
import 'package:note_app/ui/utils/utils.dart';

// import 'view_models/note.dart';
import '../screens/note/note_screen_controller.dart';
import '../view_models/note.dart';
part 'note_store.g.dart';

@singleton
class NoteStore = _NoteStoreBase with _$NoteStore;

abstract class _NoteStoreBase with Store {
  late final NoteScreenController noteController;

  final NoteServicePort _noteServicePort;

  _NoteStoreBase(this._noteServicePort) {
    noteController = NoteScreenController(this as NoteStore);
  }

  @observable
  bool loading = false;

  @observable
  String? errorText;

  @observable
  ObservableList<ViewNote> notes = ObservableList<ViewNote>();

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
  Future<void> getAllNotes() async {
    errorText = null;

    try {
      loading = true;

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
      errorText = 'An error occurred, please try again';
    } finally {
      loading = false;
    }
  }
}
