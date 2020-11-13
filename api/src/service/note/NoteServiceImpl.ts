import 'reflect-metadata';
import Note from '@entity/Note';
import { injectable, inject } from 'tsyringe';
import NoteRepository from '@repository/note/NoteRepository';
import AppError from '@web/exception/AppError';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';
import NoteUpdateDTO from '@web/dto/NoteUpdateDTO';
import NoteService from './NoteService';

@injectable()
export default class NoteServiceImpl implements NoteService {
  constructor(
    @inject('NoteRepository')
    private noteRepository: NoteRepository,
  ) {
    // empty
  }

  public async index(userId: string): Promise<Note[]> {
    const notes = await this.noteRepository.findByUserId(userId);

    return notes;
  }

  public async delete(id: string): Promise<void> {
    const noteFound = await this.noteRepository.findById(id);

    if (!noteFound) {
      throw new AppError('Note not found');
    }

    await this.noteRepository.delete(id);
  }

  public async update(note: NoteUpdateDTO): Promise<Note> {
    const noteFound = await this.noteRepository.findById(note.id);

    if (!noteFound) {
      throw new AppError('Note not found');
    }

    const updatedAt = new Date();

    const noteUpdated = new Note(note.id, note.title, note.text, updatedAt);

    const noteSaved = await this.noteRepository.save(noteUpdated);

    return noteSaved;
  }

  public async show(id: string): Promise<Note> {
    const note = await this.noteRepository.findById(id);

    if (!note) {
      throw new AppError('Note not found');
    }

    return note;
  }

  public async create(noteRegister: NoteRegisterDTO): Promise<Note> {
    const note = await this.noteRepository.create(noteRegister);

    return note;
  }
}
