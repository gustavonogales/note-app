import { Injectable } from '@nestjs/common';
import User from '../model/user.model';
import { v4 as uuidv4 } from 'uuid';
import { CreateUserDTO } from '../dto/create-user.dto';
import UserRepositoryInterface from './user.repository.interface';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserDAO } from '../entity/user.entity';

@Injectable()
export class UserRepository implements UserRepositoryInterface {
  // private users: User[] = [];

  constructor(
    @InjectRepository(UserDAO)
    private repository: Repository<UserDAO>,
  ) {}

  public async create({ name, email, password, avatar }: User): Promise<User> {
    // const id = uuidv4();
    // const { name, email, password } = createUser;
    // const user = new User(id, name, email, password, '');

    // this.users.push(user);
    const userDAO = await this.repository.save({
      name,
      email,
      password,
      avatar,
    });

    const user = new User(
      userDAO.id,
      userDAO.name,
      userDAO.email,
      userDAO.password,
      userDAO.avatar,
    );

    return user;
  }
}
