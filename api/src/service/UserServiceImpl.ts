import User from '@entity/User';
import { injectable, inject } from 'tsyringe';
import UserRepository from '@repository/user/UserRepository';

@injectable()
export default class UserServiceImpl {
  constructor(
    @inject('UserRepository')
    private userRepository: UserRepository,
  ) {
    // empty
  }

  public async create(user: User): Promise<User> {
    const userCreated = await this.userRepository.create(user);

    return userCreated;
  }
}
