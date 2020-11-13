import Note from '@entity/Note';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';
import NoteUpdateDTO from '@web/dto/NoteUpdateDTO';

export default interface NoteService {
  create(noteRegister: NoteRegisterDTO): Promise<Note>;
  update(noteUpdate: NoteUpdateDTO): Promise<Note>;
  show(id: string): Promise<Note>;
  index(userId: string): Promise<Note[]>;
  delete(id: string): Promise<void>;
}
