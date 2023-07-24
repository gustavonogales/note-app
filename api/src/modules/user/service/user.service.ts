import { HttpStatus, Injectable } from '@nestjs/common';
import { HashServiceImpl } from 'src/shared/modules/hash';
import { AppError } from 'src/shared/utils/AppError';
import UpdateUserDTO from '../dto/update-user.dto';
import User from '../model/user.model';
import { UserRepository } from '../repository/user.repository';
import UserServiceInterface from './user.service.interface';
import { StorageServiceImpl } from 'src/shared/modules/storage';
import UpdateUserAvatarDTO from '../dto/update-user-avatar.dto';

@Injectable()
export class UserService implements UserServiceInterface {
  constructor(
    private userRepository: UserRepository,
    private hashService: HashServiceImpl,
    private storageService: StorageServiceImpl,
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

    if (user.password) {
      hashedPassword = await this.hashService.generateHash(user.password);
    }

    const userUpdated = new User(
      user.id,
      user.name || userFound.name,
      user.email || userFound.email,
      hashedPassword || userFound.password,
      userFound.avatar || '',
    );

    const userSaved = await this.userRepository.save(userUpdated);

    return userSaved;
  }

  public async updateAvatar({
    id,
    filename,
  }: UpdateUserAvatarDTO): Promise<User> {
    const user = await this.userRepository.findById(id);

    if (!user) {
      throw new AppError('Only authenticated users can change the avatar', 403);
    }

    const encodedImage = await this.storageService.buffer(filename);

    await this.storageService.deleteFile(filename);

    const userWithAvatar = new User(
      user.id,
      user.name,
      user.email,
      user.password,
      encodedImage,
    );

    await this.userRepository.save(userWithAvatar);

    return userWithAvatar;
  }
}
