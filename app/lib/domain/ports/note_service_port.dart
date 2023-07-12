import '../domain.dart';

abstract interface class NoteServicePort {
  Future<List<Note>> getAll();
}
