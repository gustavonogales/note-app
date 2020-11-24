import HashProvider from '@shared/provider/HashProvider/implementation/HashProviderImpl.mock';
import UserRepositoryImpl from '@repository/user/UserRepositoryImpl.mock';
import UserServiceImpl from '@service/user/UserServiceImpl';
import SessionServiceImpl from '@service/session/SessionServiceImpl';
import TokenProviderImpl from '@shared/provider/TokenProvider/implementation/TokenProviderImpl.mock';
import StorageProviderImpl from '@shared/provider/StorageProvider/implementation/StorageProviderImpl.mock';
import AppError from '@web/exception/AppError';

let userRepository: UserRepositoryImpl;
let hashProvider: HashProvider;
let storageProvider: StorageProviderImpl;
let tokenProvider: TokenProviderImpl;
let userService: UserServiceImpl;
let sessionService: SessionServiceImpl;

describe('SessionService - Create', () => {
  beforeEach(() => {
    userRepository = new UserRepositoryImpl();
    hashProvider = new HashProvider();
    storageProvider = new StorageProviderImpl();
    tokenProvider = new TokenProviderImpl();

    userService = new UserServiceImpl(
      userRepository,
      hashProvider,
      storageProvider,
    );

    sessionService = new SessionServiceImpl(
      userRepository,
      hashProvider,
      tokenProvider,
    );
  });

  it('should be able to signin an user', async () => {
    const user = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    const { email, password } = user;

    const response = await sessionService.create({ email, password });

    expect(response.user).toEqual(user);
    expect(response.token).toEqual(user.id);
  });

  it('should not be able to signin with non existing user', async () => {
    expect(
      sessionService.create({
        email: 'wrong-user@gmail.com',
        password: '123456',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });

  it('should not be able to signin with wrong password', async () => {
    await userService.create({
      name: 'John Doe',
      email: 'john.doe@gmail.com',
      password: '123456',
    });

    await expect(
      sessionService.create({
        email: 'john.doe@gmail.com',
        password: 'wrong-password',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });
});
