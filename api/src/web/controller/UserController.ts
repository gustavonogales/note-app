/* eslint-disable camelcase */
import UserRegisterDTO from '@dto/UserRegisterDTO';
import { Request, Response } from 'express';
import UserResponseDTO from '@web/dto/UserResponseDTO';
import UserUpdateDTO from '@web/dto/UserUpdateDTO';
import UserServiceImpl from '@service/user/UserServiceImpl';
import { container } from 'tsyringe';

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

    return response.json(UserResponseDTO.fromUser(user));
  }

  public async update(request: Request, response: Response): Promise<Response> {
    const userId = request.user.id;
    const { name, email, password, old_password } = request.body;

    const userUpdate = {
      id: userId,
      name,
      email,
      password,
      old_password,
    } as UserUpdateDTO;

    const userService = container.resolve(UserServiceImpl);
    const user = await userService.update(userUpdate);

    return response.json(UserResponseDTO.fromUser(user));
  }

  public async show(request: Request, response: Response): Promise<Response> {
    const userId = request.user.id;

    const userService = container.resolve(UserServiceImpl);

    const user = await userService.findById(userId);

    return response.json(user);
  }
}
