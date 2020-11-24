/* eslint-disable camelcase */
import { Request, Response } from 'express';
import SessionServiceImpl from '@service/session/SessionServiceImpl';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';

export default class SessionController {
  public async create(request: Request, response: Response): Promise<Response> {
    const { email, password } = request.body;

    const sessionService = container.resolve(SessionServiceImpl);

    const { user, token } = await sessionService.create({ email, password });

    return response.json({
      user: classToClass(user),
      token,
    });
  }
}
