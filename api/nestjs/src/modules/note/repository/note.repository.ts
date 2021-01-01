import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreateNoteDTO } from '../dto/create-note.dto';
import { NoteEntity } from '../entity/note.entity';
import Note from '../model/note.model';
import NoteRepositoryInterface from './note.repository.interface';

@Injectable()
export class NoteRepository implements NoteRepositoryInterface {
  constructor(
    @InjectRepository(NoteEntity)
    private repository: Repository<NoteEntity>,
  ) {}

  async create(createNote: CreateNoteDTO): Promise<Note> {
    const note = this.repository.create(createNote);

    await this.repository.save(note);

    return note.toNote();
  }

  async index(user_id: string): Promise<Note[]> {
    const notes = this.repository.find({ user_id });
  }

  // findById(id: string): Promise<Note> {
  //   throw new Error('Method not implemented.');
  // }
  // save(note: noteModel): Promise<Note> {
  //   throw new Error('Method not implemented.');
  // }
  // remove(note: noteModel): Promise<void> {
  //   throw new Error('Method not implemented.');
  // }
}
