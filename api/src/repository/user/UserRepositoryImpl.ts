import User from '@entity/User';
import { getRepository, Repository } from 'typeorm';
import UserDAO from './UserDAO';
import UserRepository from './UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  private ormRepository: Repository<UserDAO>;

  constructor() {
    this.ormRepository = getRepository(UserDAO);
  }

  public async create(user: User): Promise<User> {
    const userCreated = this.ormRepository.create(user);

    return userCreated.toUser();
  }
}
