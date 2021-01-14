import { CreateNoteDTO } from '../dto/create-note.dto';
import Note from '../model/note.model';

export default interface NoteRepositoryInterface {
  create(createNote: CreateNoteDTO): Promise<Note>;
  findByUserId(user_id: string): Promise<Note[]>;
  findById(id: string): Promise<Note | undefined>;
  delete(id: string): Promise<void>;
  save(note: Note): Promise<Note>;
}
