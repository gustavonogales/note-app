import 'reflect-metadata';
import User from '@entity/User';
import { injectable, inject } from 'tsyringe';
import UserRepository from '@repository/user/UserRepository';
import AppError from '@web/exception/AppError';
import HashProvider from '@shared/provider/HashProvider/adapter/HashProvider';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';
import UserUpdateDTO from '@web/dto/UserUpdateDTO';
import UserUpdateAvatarDTO from '@web/dto/UserUpdateAvatarDTO';
import StorageProvider from '@shared/provider/StorageProvider/adapter/StorageProvider';
import UserService from './UserService';

@injectable()
export default class UserServiceImpl implements UserService {
  constructor(
    @inject('UserRepository')
    private userRepository: UserRepository,

    @inject('HashProvider')
    private hashProvider: HashProvider,

    @inject('StorageProvider')
    private storageProvider: StorageProvider,
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
      userFound.avatar || '',
    );

    const userSaved = await this.userRepository.save(userUpdated);

    return userSaved;
  }

  public async show(id: string): Promise<User> {
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

  public async updateAvatar({
    userId,
    avatarFilename,
  }: UserUpdateAvatarDTO): Promise<User> {
    const user = await this.userRepository.findById(userId);

    if (!user) {
      throw new AppError('Only authenticated users can change the avatar', 401);
    }

    if (user.avatar) {
      await this.storageProvider.deleteFile(avatarFilename);
    }

    const filename = await this.storageProvider.saveFile(avatarFilename);

    const userWithAvatar = new User(
      userId,
      user.name,
      user.email,
      user.password,
      filename,
    );

    await this.userRepository.save(userWithAvatar);

    return userWithAvatar;
  }
}
