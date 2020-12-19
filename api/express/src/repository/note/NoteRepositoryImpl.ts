import Note from '@entity/Note';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';
import { getRepository, Repository } from 'typeorm';
import NoteDAO from './NoteDAO';
import NoteRepository from './NoteRepository';

export default class NoteRepositoryImpl implements NoteRepository {
  private ormRepository: Repository<NoteDAO>;

  constructor() {
    this.ormRepository = getRepository(NoteDAO);
  }

  public async delete(id: string): Promise<void> {
    await this.ormRepository.delete(id);
  }

  public async findById(id: string): Promise<Note | undefined> {
    const note = await this.ormRepository.findOne(id);

    return note?.toNote();
  }

  public async findByUserId(userId: string): Promise<Note[]> {
    const notesDAO = await this.ormRepository.find({
      where: { user_id: userId },
    });

    const notes = notesDAO.map(note => {
      return note.toNote();
    });

    return notes;
  }

  public async save(note: Note): Promise<Note> {
    await this.ormRepository.save(note);

    return note;
  }

  public async create(noteRegister: NoteRegisterDTO): Promise<Note> {
    const note = this.ormRepository.create(noteRegister);

    await this.ormRepository.save(note);

    return note.toNote();
  }
}
