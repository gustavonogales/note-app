import User from '@entity/User';
import { getRepository, Repository } from 'typeorm';
import UserDAO from './UserDAO';
import UserRepository from './UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  private ormRepository: Repository<UserDAO>;

  constructor() {
    this.ormRepository = getRepository(UserDAO);
  }

  findById(id: string): Promise<User | undefined> {
    throw new Error('Method not implemented.');
  }

  findByEmail(email: string): Promise<User | undefined> {
    throw new Error('Method not implemented.');
  }

  save(user: User): Promise<User> {
    throw new Error('Method not implemented.');
  }

  public async create(user: User): Promise<User> {
    const { name, email, password } = user;
    const userCreated = this.ormRepository.create({ name, email, password });

    await this.ormRepository.save(userCreated);

    return userCreated.toUser();
  }
}
