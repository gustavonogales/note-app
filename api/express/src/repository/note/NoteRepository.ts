import Note from '@entity/Note';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';

export default interface NoteRepository {
  create(noteRegister: NoteRegisterDTO): Promise<Note>;
  findByUserId(userId: string): Promise<Note[]>;
  findById(id: string): Promise<Note | undefined>;
  delete(id: string): Promise<void>;
  save(note: Note): Promise<Note>;
}
