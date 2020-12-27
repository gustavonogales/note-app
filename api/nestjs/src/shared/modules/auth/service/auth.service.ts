import { Injectable } from '@nestjs/common';
import { AppError } from 'src/shared/utils/AppError';
import { Auth } from '../model/auth.model';
import AuthServiceInterface from './auth.service.interface';
import { JwtService } from '@nestjs/jwt';
import { classToClass } from 'class-transformer';
import { UserCredentialsDTO } from '../dto/user-credentials.dto';
import { UserRepository } from 'src/modules/user/repository/user.repository';
import { HashServiceImpl } from '../../hash';

@Injectable()
export class AuthService implements AuthServiceInterface {
  constructor(
    private userRepository: UserRepository,
    private hashService: HashServiceImpl,
    private jwtService: JwtService,
  ) {}

  async create({ email, password }: UserCredentialsDTO): Promise<Auth> {
    const user = await this.userRepository.findByEmail(email);

    if (!user) {
      throw new AppError('User not found', 401);
    }

    const passwordMatch = await this.hashService.compareHash(
      password,
      user?.password ? user.password : '',
    );

    if (!passwordMatch) {
      throw new AppError('Incorrect email/password', 401);
    }

    const token = this.jwtService.sign({
      email,
      id: user.id,
    });

    return {
      user: classToClass(user),
      token,
    };
  }
}
