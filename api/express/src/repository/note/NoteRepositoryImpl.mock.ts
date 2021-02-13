import Note from '@entity/Note';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';
import { v4 as uuidv4 } from 'uuid';
import NoteRepository from './NoteRepository';

export default class NoteRepositoryImpl implements NoteRepository {
  private notes: Note[] = [];

  public async delete(id: string): Promise<void> {
    this.notes = this.notes.filter(note => note.id !== id);
  }

  public async findById(id: string): Promise<Note | undefined> {
    const noteFound = this.notes.find(note => note.id === id);

    return noteFound;
  }

  public async findByUserId(userId: string): Promise<Note[]> {
    const userNotes = this.notes.filter(note => note.user_id === userId);

    return userNotes;
  }

  public async save(note: Note): Promise<Note> {
    const findIndex = this.notes.findIndex(findNote => findNote.id === note.id);

    this.notes[findIndex] = note;

    return note;
  }

  public async create(noteRegister: NoteRegisterDTO): Promise<Note> {
    const { user_id, title, text, color } = noteRegister;
    const note = new Note(uuidv4(), user_id, title, text, color, new Date());

    this.notes.push(note);

    return note;
  }
}
