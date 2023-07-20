// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteStore on _NoteStoreBase, Store {
  late final _$loadingAtom =
      Atom(name: '_NoteStoreBase.loading', context: context);

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

  late final _$errorTextAtom =
      Atom(name: '_NoteStoreBase.errorText', context: context);

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
    });
  }

  late final _$notesAtom = Atom(name: '_NoteStoreBase.notes', context: context);

  @override
  ObservableList<ViewNote> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<ViewNote> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$layoutAtom =
      Atom(name: '_NoteStoreBase.layout', context: context);

  @override
  ObservableList<Layout> get layout {
    _$layoutAtom.reportRead();
    return super.layout;
  }

  @override
  set layout(ObservableList<Layout> value) {
    _$layoutAtom.reportWrite(value, super.layout, () {
      super.layout = value;
    });
  }

  late final _$getAllNotesAsyncAction =
      AsyncAction('_NoteStoreBase.getAllNotes', context: context);

  @override
  Future<void> getAllNotes() {
    return _$getAllNotesAsyncAction.run(() => super.getAllNotes());
  }

  late final _$_NoteStoreBaseActionController =
      ActionController(name: '_NoteStoreBase', context: context);

  @override
  dynamic setSelectedNote(ViewNote? note) {
    final _$actionInfo = _$_NoteStoreBaseActionController.startAction(
        name: '_NoteStoreBase.setSelectedNote');
    try {
      return super.setSelectedNote(note);
    } finally {
      _$_NoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
errorText: ${errorText},
notes: ${notes},
layout: ${layout}
    ''';
  }
}
