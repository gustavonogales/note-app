import UserDTO from '@dto/UserDTO';
import User from '@entity/User';
import UserRepository from './adapter/UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  async create({ name, email, password }: UserDTO): Promise<User> {
    const user = new User('1', name, email, password);

    return user;
  }
}
