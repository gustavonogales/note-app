import { Injectable } from '@nestjs/common';
import User from '../model/user.model';
import UserRepositoryInterface from './user.repository.interface';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserEntity } from '../entity/user.entity';

@Injectable()
export class UserRepository implements UserRepositoryInterface {
  constructor(
    @InjectRepository(UserEntity)
    private repository: Repository<UserEntity>,
  ) {}

  public async findById(id: string): Promise<User | undefined> {
    const userEntity = await this.repository.findOne({ where: { id } });

    return userEntity?.toUser();
  }

  public async findByEmail(email: string): Promise<User | undefined> {
    const userEntity = await this.repository.findOne({ where: { email } });

    return userEntity?.toUser();
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

  async delete(id: string): Promise<void> {
    const user = await this.repository.findOne({ where: { id } });
    await this.repository.remove(user);
  }
}
