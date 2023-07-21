import 'package:injectable/injectable.dart';
import 'package:note_app/domain/models/note.dart';
import 'package:note_app/adapter/adapter.dart';

import '../ports/note_service_port.dart';
import 'dtos/note.dto.dart';

@Singleton(as: NoteServicePort)
final class NoteService implements NoteServicePort {
  late final HttpClientPort _httpAdapter;

  NoteService(HttpClientPort httpAdapter) {
    _httpAdapter = httpAdapter;
  }

  @override
  Future<List<Note>> getAll() async {
    final response = await _httpAdapter.send(to: '/note', method: Method.get);

    final List<Note> notes = [];

    for (var json in response.body as List<dynamic>) {
      notes.add(NoteDto.fromJson(json));
    }

    return notes;
  }

  @override
  Future<void> save({
    required String title,
    required String text,
    required String color,
  }) async {
    await _httpAdapter.send(
      to: '/note',
      method: Method.post,
      body: {
        'title': title,
        'text': text,
        'color': color,
      },
    );
  }

  @override
  Future<void> update(Note note) async {
    await _httpAdapter.send(
      to: '/note/${note.id}',
      method: Method.patch,
      body: {
        'title': note.title,
        'text': note.text,
        'color': note.color,
      },
    );
  }

  @override
  Future<Note> create(Note note) async {
    final response = await _httpAdapter.send(
      to: '/note',
      method: Method.post,
      body: {
        'title': note.title,
        'text': note.text,
        'color': note.color,
      },
    );

    return NoteDto.fromJson(response.body);
  }

  @override
  Future<void> deleteMany(List<String> ids) async {
    await _httpAdapter.send(
      to: '/note',
      method: Method.delete,
      body: {'ids': ids},
    );
  }
}
