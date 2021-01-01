import { Injectable } from '@nestjs/common';
import { CreateNoteDTO } from '../dto/create-note.dto';
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
    return this.noteRepository.index(user_id);
  }
}
