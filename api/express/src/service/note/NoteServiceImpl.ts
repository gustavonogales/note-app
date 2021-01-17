import 'reflect-metadata';
import Note from '@entity/Note';
import { injectable, inject } from 'tsyringe';
import NoteRepository from '@repository/note/NoteRepository';
import AppError from '@web/exception/AppError';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';
import NoteUpdateDTO from '@web/dto/NoteUpdateDTO';
import CacheProvider from '@shared/provider/CacheProvider/adapter/CacheProvider';
import { classToClass } from 'class-transformer';
import NoteService from './NoteService';

@injectable()
export default class NoteServiceImpl implements NoteService {
  constructor(
    @inject('NoteRepository')
    private noteRepository: NoteRepository,

    @inject('CacheProvider')
    private cacheProvider: CacheProvider,
  ) {
    // empty
  }

  public async index(userId: string): Promise<Note[]> {
    const cacheKey = `notes:${userId}`;

    let notes = await this.cacheProvider.recover<Note[]>(cacheKey);

    if (!notes) {
      notes = await this.noteRepository.findByUserId(userId);

      await this.cacheProvider.save(cacheKey, classToClass(notes));
    }

    return notes;
  }

  public async delete(id: string): Promise<void> {
    const noteFound = await this.noteRepository.findById(id);

    if (!noteFound) {
      throw new AppError('Note not found');
    }

    await this.noteRepository.delete(id);

    await this.cacheProvider.invalidate(`notes:${noteFound.user_id}`);
  }

  public async update(note: NoteUpdateDTO): Promise<Note> {
    const noteFound = await this.noteRepository.findById(note.id);

    if (!noteFound) {
      throw new AppError('Note not found');
    }

    const updatedAt = new Date();

    const noteUpdated = new Note(
      note.id,
      note.user_id,
      note.title,
      note.text,
      updatedAt,
    );

    await this.cacheProvider.invalidate(`notes:${note.user_id}`);

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

    await this.cacheProvider.invalidate(`notes:${noteRegister.user_id}`);

    return note;
  }
}
