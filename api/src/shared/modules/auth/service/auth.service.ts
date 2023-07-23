import { Injectable } from '@nestjs/common';
import { AppError } from 'src/shared/utils/AppError';
import { Auth } from '../model/auth.model';
import AuthServiceInterface from './auth.service.interface';
import { JwtService } from '@nestjs/jwt';
import { classToClass } from 'class-transformer';
import { UserCredentialsDTO } from '../dto/user-credentials.dto';
import { UserRepository } from 'src/modules/user/repository/user.repository';
import { HashServiceImpl } from '../../hash';
import { ConfigService } from '@nestjs/config';
import { RefreshTokenDTO } from '../dto/refresh-token.dto';

@Injectable()
export class AuthService implements AuthServiceInterface {
  constructor(
    private userRepository: UserRepository,
    private hashService: HashServiceImpl,
    private jwtService: JwtService,
    private configService: ConfigService,
  ) {}

  private async getTokens(email: string, sub: string) {
    const secret = this.configService.get('APP_JWT_SECRET');

    const token = await this.jwtService.signAsync(
      { email, sub },
      {
        secret,
        expiresIn: this.configService.get('APP_JWT_EXPIRES'),
      },
    );

    const refreshToken = await this.jwtService.signAsync(
      { email, sub },
      {
        secret,
        expiresIn: this.configService.get('APP_JWT_REFRESH_EXPIRES'),
      },
    );

    this.jwtService.verify(refreshToken, { secret });
    return [token, refreshToken];
  }

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

    const [token, refreshToken] = await this.getTokens(email, user.id);

    return {
      user: classToClass(user),
      token,
      refreshToken,
    };
  }

  async recreate({ id, email }: RefreshTokenDTO): Promise<Auth> {
    const user = await this.userRepository.findById(id);

    if (!user) {
      throw new AppError('User not found', 404);
    }

    const [token, refreshToken] = await this.getTokens(email, id);
    return {
      user: classToClass(user),
      token,
      refreshToken,
    };
  }
}
