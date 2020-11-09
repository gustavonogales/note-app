import User from '@entity/User';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';
import { getRepository, Repository } from 'typeorm';
import UserDAO from './UserDAO';
import UserRepository from './UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  private ormRepository: Repository<UserDAO>;

  constructor() {
    this.ormRepository = getRepository(UserDAO);
  }

  public async findById(id: string): Promise<User | undefined> {
    const userDAO = await this.ormRepository.findOne(id);

    return userDAO?.toUser();
  }

  public async findByEmail(email: string): Promise<User | undefined> {
    const userDAO = await this.ormRepository.findOne({ where: { email } });

    return userDAO?.toUser();
  }

  public async save(user: User): Promise<User> {
    await this.ormRepository.save(user);

    return user;
  }

  public async create(userRegister: UserRegisterDTO): Promise<User> {
    const userCreated = this.ormRepository.create(userRegister);

    await this.ormRepository.save(userCreated);

    return userCreated.toUser();
  }
}
