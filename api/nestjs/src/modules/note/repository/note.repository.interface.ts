import { CreateNoteDTO } from '../dto/create-note.dto';
import Note from '../model/note.model';

export default interface NoteRepositoryInterface {
  create(createNote: CreateNoteDTO): Promise<Note>;
  index(user_id: string): Promise<Note[]>;
  // findById(id: string): Promise<Note | undefined>;
  // save(note: Note): Promise<Note>;
  // remove(note: Note): Promise<void>;
}
