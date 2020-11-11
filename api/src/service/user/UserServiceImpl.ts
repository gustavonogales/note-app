import 'reflect-metadata';
import User from '@entity/User';
import { injectable, inject } from 'tsyringe';
import UserRepository from '@repository/user/UserRepository';
import AppError from '@web/exception/AppError';
import HashProvider from '@shared/provider/HashProvider/adapter/HashProvider';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';
import UserUpdateDTO from '@web/dto/UserUpdateDTO';
import UserService from './UserService';

@injectable()
export default class UserServiceImpl implements UserService {
  constructor(
    @inject('UserRepository')
    private userRepository: UserRepository,

    @inject('HashProvider')
    private hashProvider: HashProvider,
  ) {
    // empty
  }

  public async update(user: UserUpdateDTO): Promise<User> {
    const userFound = await this.userRepository.findById(user.id);
    let hashedPassword = '';

    if (!userFound) {
      throw new AppError('User not found');
    }

    const userWithSameEmail = await this.userRepository.findByEmail(user.email);

    if (userWithSameEmail && userWithSameEmail.id !== user.id) {
      throw new AppError('E-mail already in use');
    }

    if (user.password && !user.oldPassword) {
      throw new AppError('Current password is needed to change your password');
    }

    if (user.password && user.oldPassword) {
      const checkPasswords = await this.hashProvider.compareHash(
        user.oldPassword,
        userFound.password,
      );

      if (!checkPasswords) {
        throw new AppError('Current password is incorrect');
      }

      hashedPassword = await this.hashProvider.generateHash(user.password);
    }

    const userUpdated = new User(
      user.id,
      user.name,
      user.email,
      hashedPassword || userFound.password,
    );

    const userSaved = await this.userRepository.save(userUpdated);

    return userSaved;
  }

  public async show(id: string): Promise<User | undefined> {
    const user = await this.userRepository.findById(id);

    if (!user) {
      throw new AppError('User not found');
    }

    return user;
  }

  public async create(userRegister: UserRegisterDTO): Promise<User> {
    const userExists = await this.userRepository.findByEmail(
      userRegister.email,
    );

    if (userExists) {
      throw new AppError('User already exists', 400);
    }

    const hashedPassword = await this.hashProvider.generateHash(
      userRegister.password,
    );

    const userHashed = {
      name: userRegister.name,
      email: userRegister.email,
      password: hashedPassword,
    };

    const userCreated = await this.userRepository.create(userHashed);

    return userCreated;
  }
}
