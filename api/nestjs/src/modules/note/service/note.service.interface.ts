import { CreateNoteDTO } from '../dto/create-note.dto';
import Note from '../model/note.model';

export interface NoteServiceInterface {
  create(createNote: CreateNoteDTO): Promise<Note>;
  index(user_id: string): Promise<Note[]>;
}
