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

  async findByUserId(user_id: string): Promise<Note[]> {
    const notes = await this.repository.find({
      where: { user_id },
      order: { created_at: 'ASC' },
    });

    const response = notes.map((note) => note.toNote());
    return response;
  }

  public async findById(id: string): Promise<Note | undefined> {
    const note = await this.repository.findOne({
      where: { id },
    });

    return note?.toNote();
  }

  public async save(note: Note): Promise<Note> {
    await this.repository.save(note);

    return note;
  }

  public async delete(id: string): Promise<void> {
    this.repository.delete(id);
  }

  public async deleteMany(ids: string[]): Promise<void> {
    this.repository.delete(ids);
  }
}
