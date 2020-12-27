import { Injectable } from '@nestjs/common';
import User from '../model/user.model';
import UserRepositoryInterface from './user.repository.interface';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserDAO } from '../entity/user.entity';

@Injectable()
export class UserRepository implements UserRepositoryInterface {
  constructor(
    @InjectRepository(UserDAO)
    private repository: Repository<UserDAO>,
  ) {}

  public async findById(id: string): Promise<User | undefined> {
    const userDAO = await this.repository.findOne(id);

    return userDAO?.toUser();
  }

  public async findByEmail(email: string): Promise<User | undefined> {
    const userDAO = await this.repository.findOne({ where: { email } });

    return userDAO?.toUser();
  }

  public async save(user: User): Promise<User> {
    await this.repository.save(user);

    return user;
  }

  public async create({ name, email, password, avatar }: User): Promise<User> {
    const userCreated = this.repository.create({
      name,
      email,
      password,
      avatar,
    });

    await this.repository.save(userCreated);

    return userCreated.toUser();
  }
}
