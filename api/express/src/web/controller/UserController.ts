/* eslint-disable camelcase */
import UserRegisterDTO from '@dto/UserRegisterDTO';
import { Request, Response } from 'express';
import UserUpdateDTO from '@web/dto/UserUpdateDTO';
import UserServiceImpl from '@service/user/UserServiceImpl';
import { container } from 'tsyringe';
import { classToClass } from 'class-transformer';

export default class UserController {
  public async create(request: Request, response: Response): Promise<Response> {
    const { name, email, password } = request.body;

    const userRegister = {
      name,
      email,
      password,
    } as UserRegisterDTO;

    const userService = container.resolve(UserServiceImpl);

    const user = await userService.create(userRegister);

    return response.json(classToClass(user));
  }

  public async update(request: Request, response: Response): Promise<Response> {
    const userId = request.user.id;
    const { name, email, password, old_password } = request.body;

    const userUpdate = {
      id: userId,
      name,
      email,
      password,
      oldPassword: old_password,
    } as UserUpdateDTO;

    const userService = container.resolve(UserServiceImpl);
    const user = await userService.update(userUpdate);

    return response.json(classToClass(user));
  }

  public async show(request: Request, response: Response): Promise<Response> {
    const userId = request.user.id;

    const userService = container.resolve(UserServiceImpl);

    const user = await userService.show(userId);

    return response.json(classToClass(user));
  }

  public async updateAvatar(
    request: Request,
    response: Response,
  ): Promise<Response> {
    const userService = container.resolve(UserServiceImpl);

    const user = await userService.updateAvatar({
      userId: request.user.id,
      avatarFilename: request.file.filename,
    });

    return response.json(classToClass(user));
  }
}
