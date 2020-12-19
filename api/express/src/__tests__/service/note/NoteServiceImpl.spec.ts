// import AppError from '@web/exception/AppError';
import NoteRepositoryImpl from '@repository/note/NoteRepositoryImpl.mock';
import NoteServiceImpl from '@service/note/NoteServiceImpl';
import AppError from '@web/exception/AppError';

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

  it("should be able to show the users' notes", async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    const notes = await noteService.index('123');

    expect(notes).toContain(note);
  });

  it('should be able to show specific note', async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    const noteFound = await noteService.show(note.id);

    expect(!!noteFound).toBeTruthy();
  });

  it('should be able to delete a note', async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    await noteService.create({
      user_id: '123',
      title: 'Sample title 2',
      text: 'Lorem Ipsum',
    });

    const deleteFunction = jest.spyOn(noteService, 'delete');

    await noteService.delete(note.id);

    const notes = await noteService.index('123');

    expect(deleteFunction).toHaveBeenCalled();
    expect(notes.length).toBe(1);
  });

  it("should not be able to delete a note that don't exists", async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    await noteService.delete(note.id);

    await expect(noteService.delete(note.id)).rejects.toBeInstanceOf(AppError);
  });

  it("should not be able to show specific note that don't exists", async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    await noteService.delete(note.id);

    await expect(noteService.show(note.id)).rejects.toBeInstanceOf(AppError);
  });

  it('should be able to update a note', async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    await noteService.update({
      user_id: note.user_id,
      id: note.id,
      title: 'New Sample Title',
      text: 'New Text',
    });

    const noteFound = await noteService.show(note.id);

    expect(noteFound.title).toEqual('New Sample Title');
    expect(noteFound.text).toEqual('New Text');
  });

  it("should not be able to update a note that don't exists", async () => {
    const note = await noteService.create({
      user_id: '123',
      title: 'Sample title',
      text: 'Lorem Ipsum',
    });

    await expect(
      noteService.update({
        user_id: note.user_id,
        id: 'wrong-id',
        title: 'New Sample Title',
        text: 'New Sample Text',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });
});
