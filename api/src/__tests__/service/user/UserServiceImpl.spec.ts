// import AppError from '@web/exception/AppError';
import HashProvider from '@shared/provider/HashProvider/implementation/HashProviderImpl.mock';
import UserRepositoryImpl from '@repository/user/UserRepositoryImpl.mock';
import UserServiceImpl from '@service/user/UserServiceImpl';

let userRepository: UserRepositoryImpl;
let hashProvider: HashProvider;
let userService: UserServiceImpl;

describe('UserService', () => {
  beforeEach(() => {
    userRepository = new UserRepositoryImpl();
    hashProvider = new HashProvider();

    userService = new UserServiceImpl(userRepository, hashProvider);
  });

  it('should be able to create a new user', async () => {
    const user = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    expect(user).toHaveProperty('id');
  });
});
