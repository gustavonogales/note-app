import { HttpStatus, Injectable } from '@nestjs/common';
import { AppError } from 'src/shared/utils/AppError';
import { CreateNoteDTO } from '../dto/create-note.dto';
import { UpdateNote } from '../dto/update-note.dto';
import Note from '../model/note.model';
import { NoteRepository } from '../repository/note.repository';
import { NoteServiceInterface } from './note.service.interface';

@Injectable()
export class NoteService implements NoteServiceInterface {
  constructor(private noteRepository: NoteRepository) {}

  async create(createNote: CreateNoteDTO): Promise<Note> {
    return this.noteRepository.create(createNote);
  }

  async index(user_id: string): Promise<Note[]> {
    return this.noteRepository.findByUserId(user_id);
  }

  async show(id: string): Promise<Note> {
    const note = await this.noteRepository.findById(id);

    if (!note) {
      throw new AppError('Note not found', HttpStatus.NOT_FOUND);
    }

    return note;
  }

  async delete(id: string): Promise<void> {
    const noteFound = await this.noteRepository.findById(id);

    if (!noteFound) {
      throw new AppError('Note not found', HttpStatus.NOT_FOUND);
    }

    await this.noteRepository.delete(id);
  }

  async update(note: UpdateNote): Promise<Note> {
    const noteFound = await this.noteRepository.findById(note.id);

    if (!noteFound) {
      throw new AppError('Note not found', HttpStatus.NOT_FOUND);
    }

    const noteUpdated = new Note(
      note.id,
      note.user_id,
      note.title,
      note.text,
      note.color,
      new Date(),
    );

    const noteSaved = await this.noteRepository.save(noteUpdated);

    return noteSaved;
  }
}
