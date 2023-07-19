// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ViewNote on _ViewNote, Store {
  Computed<Key>? _$keyComputed;

  @override
  Key get key =>
      (_$keyComputed ??= Computed<Key>(() => super.key, name: '_ViewNote.key'))
          .value;

  late final _$idAtom = Atom(name: '_ViewNote.id', context: context);

  @override
  String get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$userIdAtom = Atom(name: '_ViewNote.userId', context: context);

  @override
  String get userId {
    _$userIdAtom.reportRead();
    return super.userId;
  }

  @override
  set userId(String value) {
    _$userIdAtom.reportWrite(value, super.userId, () {
      super.userId = value;
    });
  }

  late final _$titleAtom = Atom(name: '_ViewNote.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$textAtom = Atom(name: '_ViewNote.text', context: context);

  @override
  String get text {
    _$textAtom.reportRead();
    return super.text;
  }

  @override
  set text(String value) {
    _$textAtom.reportWrite(value, super.text, () {
      super.text = value;
    });
  }

  late final _$updatedAtAtom =
      Atom(name: '_ViewNote.updatedAt', context: context);

  @override
  String get updatedAt {
    _$updatedAtAtom.reportRead();
    return super.updatedAt;
  }

  @override
  set updatedAt(String value) {
    _$updatedAtAtom.reportWrite(value, super.updatedAt, () {
      super.updatedAt = value;
    });
  }

  late final _$colorAtom = Atom(name: '_ViewNote.color', context: context);

  @override
  NoteColor get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(NoteColor value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  late final _$_ViewNoteActionController =
      ActionController(name: '_ViewNote', context: context);

  @override
  void setColor(NoteColor value) {
    final _$actionInfo =
        _$_ViewNoteActionController.startAction(name: '_ViewNote.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_ViewNoteActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(String value) {
    final _$actionInfo =
        _$_ViewNoteActionController.startAction(name: '_ViewNote.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_ViewNoteActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setText(String value) {
    final _$actionInfo =
        _$_ViewNoteActionController.startAction(name: '_ViewNote.setText');
    try {
      return super.setText(value);
    } finally {
      _$_ViewNoteActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
userId: ${userId},
title: ${title},
text: ${text},
updatedAt: ${updatedAt},
color: ${color},
key: ${key}
    ''';
  }
}
