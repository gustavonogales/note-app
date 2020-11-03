import UserServiceImpl from '@service/UserServiceImpl';
import { classToClass } from 'class-transformer';
import { Request, Response } from 'express';
import { container } from 'tsyringe';
import UserController from './adapter/UserController';

export default class UserControllerImpl implements UserController {
  public async create(request: Request, response: Response): Promise<Response> {
    const { name, email, password } = request.body;

    const userService = container.resolve(UserServiceImpl);

    const user = await userService.create({
      name,
      email,
      password,
    });

    return response.json(classToClass(user));
  }
}
