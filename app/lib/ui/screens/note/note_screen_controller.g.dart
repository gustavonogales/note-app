// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_screen_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteScreenController on _NoteScreenControllerBase, Store {
  late final _$isNewNoteAtom =
      Atom(name: '_NoteScreenControllerBase.isNewNote', context: context);

  @override
  bool get isNewNote {
    _$isNewNoteAtom.reportRead();
    return super.isNewNote;
  }

  @override
  set isNewNote(bool value) {
    _$isNewNoteAtom.reportWrite(value, super.isNewNote, () {
      super.isNewNote = value;
    });
  }

  late final _$editModeAtom =
      Atom(name: '_NoteScreenControllerBase.editMode', context: context);

  @override
  bool get editMode {
    _$editModeAtom.reportRead();
    return super.editMode;
  }

  @override
  set editMode(bool value) {
    _$editModeAtom.reportWrite(value, super.editMode, () {
      super.editMode = value;
    });
  }

  late final _$colorPickerVisibleAtom = Atom(
      name: '_NoteScreenControllerBase.colorPickerVisible', context: context);

  @override
  bool get colorPickerVisible {
    _$colorPickerVisibleAtom.reportRead();
    return super.colorPickerVisible;
  }

  @override
  set colorPickerVisible(bool value) {
    _$colorPickerVisibleAtom.reportWrite(value, super.colorPickerVisible, () {
      super.colorPickerVisible = value;
    });
  }

  late final _$noteAtom =
      Atom(name: '_NoteScreenControllerBase.note', context: context);

  @override
  ViewNote get note {
    _$noteAtom.reportRead();
    return super.note;
  }

  @override
  set note(ViewNote value) {
    _$noteAtom.reportWrite(value, super.note, () {
      super.note = value;
    });
  }

  late final _$messageTextAtom =
      Atom(name: '_NoteScreenControllerBase.messageText', context: context);

  @override
  String get messageText {
    _$messageTextAtom.reportRead();
    return super.messageText;
  }

  @override
  set messageText(String value) {
    _$messageTextAtom.reportWrite(value, super.messageText, () {
      super.messageText = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('_NoteScreenControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$_NoteScreenControllerBaseActionController =
      ActionController(name: '_NoteScreenControllerBase', context: context);

  @override
  void setNote(ViewNote? data) {
    final _$actionInfo = _$_NoteScreenControllerBaseActionController
        .startAction(name: '_NoteScreenControllerBase.setNote');
    try {
      return super.setNote(data);
    } finally {
      _$_NoteScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditMode(bool value) {
    final _$actionInfo = _$_NoteScreenControllerBaseActionController
        .startAction(name: '_NoteScreenControllerBase.setEditMode');
    try {
      return super.setEditMode(value);
    } finally {
      _$_NoteScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColorPickerVisible(bool value) {
    final _$actionInfo = _$_NoteScreenControllerBaseActionController
        .startAction(name: '_NoteScreenControllerBase.setColorPickerVisible');
    try {
      return super.setColorPickerVisible(value);
    } finally {
      _$_NoteScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cancel() {
    final _$actionInfo = _$_NoteScreenControllerBaseActionController
        .startAction(name: '_NoteScreenControllerBase.cancel');
    try {
      return super.cancel();
    } finally {
      _$_NoteScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeColor(NoteColor color) {
    final _$actionInfo = _$_NoteScreenControllerBaseActionController
        .startAction(name: '_NoteScreenControllerBase.changeColor');
    try {
      return super.changeColor(color);
    } finally {
      _$_NoteScreenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isNewNote: ${isNewNote},
editMode: ${editMode},
colorPickerVisible: ${colorPickerVisible},
note: ${note},
messageText: ${messageText}
    ''';
  }
}
