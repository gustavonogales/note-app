/* eslint-disable camelcase */
import { Request, Response } from 'express';
import NoteUpdateDTO from '@web/dto/NoteUpdateDTO';
import NoteServiceImpl from '@service/note/NoteServiceImpl';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';
import NoteRegisterDTO from '@web/dto/NoteRegisterDTO';

export default class NoteController {
  public async create(request: Request, response: Response): Promise<Response> {
    const user_id = request.user.id;
    const { title, text, color } = request.body;

    const noteRegister = {
      user_id,
      title,
      text,
      color,
    } as NoteRegisterDTO;

    const noteService = container.resolve(NoteServiceImpl);

    const note = await noteService.create(noteRegister);

    return response.json(classToClass(note));
  }

  public async update(request: Request, response: Response): Promise<Response> {
    const user_id = request.user.id;
    const { id, title, text, color } = request.body;

    const noteUpdate = {
      user_id,
      id,
      title,
      text,
      color,
    } as NoteUpdateDTO;

    const noteService = container.resolve(NoteServiceImpl);

    const note = await noteService.update(noteUpdate);

    return response.json(classToClass(note));
  }

  public async show(request: Request, response: Response): Promise<Response> {
    const { id } = request.params;

    const noteService = container.resolve(NoteServiceImpl);

    const note = await noteService.show(id);

    return response.json(classToClass(note));
  }

  public async index(request: Request, response: Response): Promise<Response> {
    const user_id = request.user.id;
    const noteService = container.resolve(NoteServiceImpl);

    const notes = await noteService.index(user_id);

    return response.json(classToClass(notes));
  }

  public async delete(request: Request, response: Response): Promise<Response> {
    const { id } = request.params;

    const noteService = container.resolve(NoteServiceImpl);

    await noteService.delete(id);

    return response.status(200).send();
  }
}
