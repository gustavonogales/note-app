import { CreateNoteDTO } from '../dto/create-note.dto';
import { UpdateNote } from '../dto/update-note.dto';
import Note from '../model/note.model';

export interface NoteServiceInterface {
  create(createNote: CreateNoteDTO): Promise<Note>;
  index(user_id: string): Promise<Note[]>;
  show(id: string): Promise<Note>;
  delete(id: string): Promise<void>;
  deleteMany(ids: string[]): Promise<void>;
  update(note: UpdateNote): Promise<Note>;
}
