import { Injectable } from '@nestjs/common';
import User from '../model/user.model';
import { v4 as uuidv4 } from 'uuid';
import { CreateUserDTO } from '../dto/create-user.dto';

@Injectable()
export class UserRepository {
  private users: User[] = [];

  public async create(createUser: CreateUserDTO): Promise<User> {
    const id = uuidv4();
    const { name, email, password } = createUser;
    const user = new User(id, name, email, password, '');

    this.users.push(user);

    return user;
  }
}
