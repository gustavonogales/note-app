import '../domain.dart';

abstract interface class NoteServicePort {
  Future<List<Note>> getAll();

  Future<void> save({
    required String title,
    required String text,
    required String color,
  });

  Future<void> update({
    required String title,
    required String text,
    required String color,
  });
}
