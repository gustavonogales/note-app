// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$notesAtom =
      Atom(name: '_HomeControllerBase.notes', context: context);

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
      Atom(name: '_HomeControllerBase.layout', context: context);

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

  late final _$loadingAtom =
      Atom(name: '_HomeControllerBase.loading', context: context);

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

  late final _$isEmptyAtom =
      Atom(name: '_HomeControllerBase.isEmpty', context: context);

  @override
  bool get isEmpty {
    _$isEmptyAtom.reportRead();
    return super.isEmpty;
  }

  @override
  set isEmpty(bool value) {
    _$isEmptyAtom.reportWrite(value, super.isEmpty, () {
      super.isEmpty = value;
    });
  }

  late final _$errorTextAtom =
      Atom(name: '_HomeControllerBase.errorText', context: context);

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

  late final _$getAllNotesAsyncAction =
      AsyncAction('_HomeControllerBase.getAllNotes', context: context);

  @override
  Future<void> getAllNotes() {
    return _$getAllNotesAsyncAction.run(() => super.getAllNotes());
  }

  @override
  String toString() {
    return '''
notes: ${notes},
layout: ${layout},
loading: ${loading},
isEmpty: ${isEmpty},
errorText: ${errorText}
    ''';
  }
}
