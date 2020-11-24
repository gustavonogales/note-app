import { injectable, inject } from 'tsyringe';
import UserRepository from '@repository/user/UserRepository';
import AppError from '@web/exception/AppError';
import HashProvider from '@shared/provider/HashProvider/adapter/HashProvider';
import TokenProvider from '@shared/provider/TokenProvider/adapter/TokenProvider';
import SessionResponseDTO from '@web/dto/SessionResponseDTO';
import UserCredentialsDTO from '@web/dto/UserCredentialsDTO';
import SessionService from './SessionService';

@injectable()
export default class SessionServiceImpl implements SessionService {
  constructor(
    @inject('UserRepository')
    private userRepository: UserRepository,

    @inject('HashProvider')
    private hashProvider: HashProvider,

    @inject('TokenProvider')
    private tokenProvider: TokenProvider,
  ) {
    // empty
  }

  public async create({
    email,
    password,
  }: UserCredentialsDTO): Promise<SessionResponseDTO> {
    const userExists = await this.userRepository.findByEmail(email);

    if (!userExists) {
      throw new AppError('Incorrect email/password', 401);
    }

    const passwordMatch = await this.hashProvider.compareHash(
      password,
      userExists?.password ? userExists.password : '',
    );

    if (!passwordMatch) {
      throw new AppError('Incorrect email/password', 401);
    }

    const token = await this.tokenProvider.generateToken(userExists.id);

    return {
      user: userExists,
      token,
    };
  }
}
