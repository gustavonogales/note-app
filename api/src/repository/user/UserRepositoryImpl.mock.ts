import User from '@entity/User';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';
import UserRepository from './UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  private users: User[];

  public async findById(id: string): Promise<User | undefined> {
    const userFound = this.users.find(user => user.id === id);

    return userFound;
  }

  public async findByEmail(email: string): Promise<User | undefined> {
    const userFound = this.users.find(user => user.email === email);

    return userFound;
  }

  public async save(user: User): Promise<User> {
    const { id, name, email, password } = user;
    await this.ormRepository.save({ id, name, email, password });

    return user;
  }

  public async create(userRegister: UserRegisterDTO): Promise<User> {
    const userCreated = this.ormRepository.create(userRegister);

    await this.ormRepository.save(userCreated);

    return userCreated.toUser();
  }
}
