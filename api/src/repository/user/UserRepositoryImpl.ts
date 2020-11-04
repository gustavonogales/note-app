import User from '@entity/User';
import UserRepository from './adapter/UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  async create(user: User): Promise<User> {
    const userCreated = new User('1', user.name, user.email, user.password);

    return userCreated;
  }
}
