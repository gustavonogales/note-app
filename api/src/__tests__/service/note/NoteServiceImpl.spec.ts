// import AppError from '@web/exception/AppError';
import NoteRepositoryImpl from '@repository/note/NoteRepositoryImpl.mock';
import NoteServiceImpl from '@service/note/NoteServiceImpl';

let noteService: NoteServiceImpl;
let noteRepository: NoteRepositoryImpl;

describe('NoteService - Create', () => {
  beforeEach(() => {
    noteRepository = new NoteRepositoryImpl();
    noteService = new NoteServiceImpl(noteRepository);
  });

  it('should be able to create a new note', async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    expect(note).toHaveProperty('id');
    expect(note.user_id).toBe('123');
  });
});
