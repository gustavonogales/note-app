import { HttpStatus, Injectable } from '@nestjs/common';
import { HashServiceImpl } from 'src/shared/modules/hash';
import { AppError } from 'src/shared/utils/AppError';
import UpdateUserDTO from '../dto/update-user.dto';
import User from '../model/user.model';
import { UserRepository } from '../repository/user.repository';
import UserServiceInterface from './user.service.interface';

@Injectable()
export class UserService implements UserServiceInterface {
  constructor(
    private userRepository: UserRepository,
    private hashService: HashServiceImpl,
  ) {}

  public async show(id: string): Promise<User> {
    const user = await this.userRepository.findById(id);

    if (!user) {
      throw new AppError('User not found', HttpStatus.NOT_FOUND);
    }

    return user;
  }

  public async create({ name, email, password, avatar }: User): Promise<User> {
    const userExists = await this.userRepository.findByEmail(email);

    if (userExists) {
      throw new AppError('User already exists', HttpStatus.NOT_ACCEPTABLE);
    }

    const encryptedPassword = await this.hashService.generateHash(password);

    const userWithPassword = {
      name,
      email,
      avatar,
      password: encryptedPassword,
    } as User;

    const user = await this.userRepository.create(userWithPassword);

    return user;
  }

  public async update(user: UpdateUserDTO): Promise<User> {
    const userFound = await this.userRepository.findById(user.id);
    let hashedPassword = '';

    if (!userFound) {
      throw new AppError('User not found', HttpStatus.NOT_FOUND);
    }

    const userWithSameEmail = await this.userRepository.findByEmail(user.email);

    if (userWithSameEmail && userWithSameEmail.id !== user.id) {
      throw new AppError('E-mail already in use', HttpStatus.NOT_ACCEPTABLE);
    }

    if (user.password && !user.oldPassword) {
      throw new AppError(
        'Current password is needed to change your password',
        HttpStatus.NOT_ACCEPTABLE,
      );
    }

    if (user.password && user.oldPassword) {
      const checkPasswords = await this.hashService.compareHash(
        user.oldPassword,
        userFound.password,
      );

      if (!checkPasswords) {
        throw new AppError(
          'Current password is incorrect',
          HttpStatus.UNAUTHORIZED,
        );
      }

      hashedPassword = await this.hashService.generateHash(user.password);
    }

    const userUpdated = new User(
      user.id,
      user.name,
      user.email,
      hashedPassword || userFound.password,
      userFound.avatar || '',
    );

    const userSaved = await this.userRepository.save(userUpdated);

    return userSaved;
  }
}
