import User from '@entity/User';
import UserDTO from '@dto/UserDTO';
import { injectable, inject } from 'tsyringe';
import UserRepository from '@repository/adapter/UserRepository';

@injectable()
export default class UserServiceImpl {
  constructor(
    @inject('UserRepository')
    private userRepository: UserRepository,
  ) {
    // empty
  }

  public async create({ name, email, password }: UserDTO): Promise<User> {
    const user = await this.userRepository.create({
      name,
      email,
      password,
    });

    return user;
  }
}
