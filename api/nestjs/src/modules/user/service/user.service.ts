import { Injectable } from '@nestjs/common';
import { HashServiceImpl } from 'src/shared/service/HashService';
import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';
import { UserRepository } from '../repository/user.repository';
import UserServiceInterface from './user.service.interface';

@Injectable()
export class UserService implements UserServiceInterface {
  constructor(
    private userRepository: UserRepository,
    private hashService: HashServiceImpl,
  ) {}

  public async create({ name, email, password }: CreateUserDTO): Promise<User> {
    const encryptedPassword = await this.hashService.generateHash(password);
    const userWithPassword = {
      name,
      email,
      password: encryptedPassword,
    };
    const user = await this.userRepository.create(userWithPassword);
    return user;
  }
}
