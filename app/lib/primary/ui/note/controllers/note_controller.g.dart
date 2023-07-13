// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteController on _NoteControllerBase, Store {
  late final _$loadingAtom =
      Atom(name: '_NoteControllerBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$editModeAtom =
      Atom(name: '_NoteControllerBase.editMode', context: context);

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

  late final _$colorPickerVisibleAtom =
      Atom(name: '_NoteControllerBase.colorPickerVisible', context: context);

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
      Atom(name: '_NoteControllerBase.note', context: context);

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

  late final _$titleAtom =
      Atom(name: '_NoteControllerBase.title', context: context);

  @override
  FieldFormState get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(FieldFormState value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$textAtom =
      Atom(name: '_NoteControllerBase.text', context: context);

  @override
  FieldFormState get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(FieldFormState value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$_NoteControllerBaseActionController =
      ActionController(name: '_NoteControllerBase', context: context);

  @override
  void setNote(ViewNote value) {
    final _$actionInfo = _$_NoteControllerBaseActionController.startAction(
        name: '_NoteControllerBase.setNote');
    try {
      return super.setNote(value);
    } finally {
      _$_NoteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEditMode(bool value) {
    final _$actionInfo = _$_NoteControllerBaseActionController.startAction(
        name: '_NoteControllerBase.setEditMode');
    try {
      return super.setEditMode(value);
    } finally {
      _$_NoteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setColorPickerVisible(bool value) {
    final _$actionInfo = _$_NoteControllerBaseActionController.startAction(
        name: '_NoteControllerBase.setColorPickerVisible');
    try {
      return super.setColorPickerVisible(value);
    } finally {
      _$_NoteControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
editMode: ${editMode},
colorPickerVisible: ${colorPickerVisible},
note: ${note},
title: ${title},
text: ${text}
    ''';
  }
}
