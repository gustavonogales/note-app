import { Injectable } from '@nestjs/common';
import { HashProviderImpl } from 'src/shared/provider/HashProvider';
import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';
import { UserRepositoryImpl } from '../repository/user.repository.impl';
import UserService from './user.service';

@Injectable()
export class UserServiceImpl implements UserService {
  constructor(
    private userRepository: UserRepositoryImpl,
    private hashProvider: HashProviderImpl,
  ) {}

  public async create({ name, email, password }: CreateUserDTO): Promise<User> {
    const encryptedPassword = await this.hashProvider.generateHash(password);
    const userWithPassword = {
      name,
      email,
      password: encryptedPassword,
    };
    const user = await this.userRepository.create(userWithPassword);
    return user;
  }
}
