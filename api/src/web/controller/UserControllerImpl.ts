import UserServiceImpl from '@service/UserServiceImpl';
import UserRegisterDTO from '@dto/UserRegisterDTO';
import { Request, Response } from 'express';
import { container } from 'tsyringe';
import UserResponseDTO from '@web/dto/UserResponseDTO';

export default class UserControllerImpl {
  public async create(request: Request, response: Response): Promise<Response> {
    const { name, email, password } = request.body;

    const userService = container.resolve(UserServiceImpl);

    const userRegister = new UserRegisterDTO(name, email, password);

    const user = await userService.create(userRegister.toUser());

    return response.json(UserResponseDTO.fromUser(user));
  }
}
