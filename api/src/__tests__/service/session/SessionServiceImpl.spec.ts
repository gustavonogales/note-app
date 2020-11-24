import HashProvider from '@shared/provider/HashProvider/implementation/HashProviderImpl.mock';
import UserRepositoryImpl from '@repository/user/UserRepositoryImpl.mock';
import UserServiceImpl from '@service/user/UserServiceImpl';
import SessionServiceImpl from '@service/session/SessionServiceImpl';
import TokenProviderImpl from '@shared/provider/TokenProvider/implementation/TokenProviderImpl.mock';
import StorageProviderImpl from '@shared/provider/StorageProvider/implementation/StorageProviderImpl.mock';
// import AppError from '@web/exception/AppError';

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

  it('should be able to sign in an user', async () => {
    const user = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });
  });
});
