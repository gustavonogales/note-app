import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../tokens/note_colors.dart';
import 'package:note_app/domain/domain.dart';

part 'note.g.dart';

class ViewNote = _ViewNote with _$ViewNote;

abstract class _ViewNote with Store {
  @observable
  String id = '';

  @observable
  String userId = '';

  @observable
  String title = '';

  @observable
  String text = '';

  @observable
  String updatedAt = DateTime.now().toIso8601String();

  @observable
  NoteColor color = NoteColor.randomColor;

  @action
  void setColor(NoteColor value) => color = value;

  @action
  void setTitle(String value) => title = value;

  @action
  void setText(String value) => text = value;

  @computed
  Key get key => Key('$id.$title.$text.${color.hexColor}.$updatedAt');

  _ViewNote();

  _ViewNote.fromModel(Note note) {
    id = note.id;
    userId = note.userId;
    title = note.title;
    text = note.text;
    updatedAt = note.updatedAt;
    color = NoteColor.fromHex(note.color);
  }

  Note toModel() => Note(
        id: id,
        title: title,
        text: text,
        userId: userId,
        updatedAt: updatedAt,
        color: color.hexColor,
      );
}
