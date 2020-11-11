import User from '@entity/User';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';
import { v4 as uuidv4 } from 'uuid';
import UserRepository from './UserRepository';

export default class UserRepositoryImpl implements UserRepository {
  private users: User[] = [];

  public async findById(id: string): Promise<User | undefined> {
    const userFound = this.users.find(user => user.id === id);

    return userFound;
  }

  public async findByEmail(email: string): Promise<User | undefined> {
    const userFound = this.users.find(user => user.email === email);

    return userFound;
  }

  public async save(user: User): Promise<User> {
    const findIndex = this.users.findIndex(findUser => findUser.id === user.id);

    this.users[findIndex] = user;

    return user;
  }

  public async create(userRegister: UserRegisterDTO): Promise<User> {
    const { name, email, password } = userRegister;
    const user = new User(uuidv4(), name, email, password);
    this.users.push(user);

    return user;
  }
}
