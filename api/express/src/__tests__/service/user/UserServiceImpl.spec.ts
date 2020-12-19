import HashProvider from '@shared/provider/HashProvider/implementation/HashProviderImpl.mock';
import UserRepositoryImpl from '@repository/user/UserRepositoryImpl.mock';
import UserServiceImpl from '@service/user/UserServiceImpl';
import StorageProviderImpl from '@shared/provider/StorageProvider/implementation/StorageProviderImpl.mock';
import AppError from '@web/exception/AppError';

let userRepository: UserRepositoryImpl;
let hashProvider: HashProvider;
let storageProvider: StorageProviderImpl;
let userService: UserServiceImpl;

describe('UserService - Create', () => {
  beforeEach(() => {
    userRepository = new UserRepositoryImpl();
    hashProvider = new HashProvider();
    storageProvider = new StorageProviderImpl();

    userService = new UserServiceImpl(
      userRepository,
      hashProvider,
      storageProvider,
    );
  });

  it('should be able to create a new user', async () => {
    const user = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    expect(user).toHaveProperty('id');
  });

  it('should not be able to create a user with an email already in use', async () => {
    await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    await expect(
      userService.create({
        name: 'John Doe 2',
        email: 'john.doe@example.com',
        password: '123456',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });
});

describe('UserService - Update', () => {
  beforeEach(() => {
    userRepository = new UserRepositoryImpl();
    hashProvider = new HashProvider();

    userService = new UserServiceImpl(
      userRepository,
      hashProvider,
      storageProvider,
    );
  });

  it('should be able to update user info', async () => {
    const { id } = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    const user = await userService.update({
      id,
      name: 'John Doe 2',
      email: 'john.doe2@example.com',
    });

    expect(user.email).toBe('john.doe2@example.com');
    expect(user.name).toBe('John Doe 2');
  });

  it('should not be able to update the password', async () => {
    const { id, name, email, password } = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    const user = await userService.update({
      id,
      name,
      email,
      oldPassword: password,
      password: 'new_password',
    });

    expect(user.password).toBe('new_password');
  });

  it('should not be able to update to an email that is already in use', async () => {
    await userService.create({
      name: 'John Doe',
      email: 'already.in.use@example.com',
      password: '123456',
    });

    const { id, name } = await userService.create({
      name: 'John Doe',
      email: 'john.doe2@example.com',
      password: '123456',
    });

    await expect(
      userService.update({
        id,
        name,
        email: 'already.in.use@example.com',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });

  it('should not be able to update the password without the current password informed', async () => {
    const { id, name, email } = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    await expect(
      userService.update({
        id,
        name,
        email,
        password: 'new_password',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });

  it('should not be able to update the password with wrong current password', async () => {
    const { id, name, email } = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    await expect(
      userService.update({
        id,
        name,
        email,
        oldPassword: 'wrong_password',
        password: 'new_password',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });

  it('should not be able to update nonexistent user', async () => {
    await expect(
      userService.update({
        id: '123',
        name: 'John Doe',
        email: 'john.doe@example.com',
      }),
    ).rejects.toBeInstanceOf(AppError);
  });
});

describe('UserService - Show', () => {
  beforeEach(() => {
    userRepository = new UserRepositoryImpl();
    hashProvider = new HashProvider();

    userService = new UserServiceImpl(
      userRepository,
      hashProvider,
      storageProvider,
    );
  });

  it('should be able to show user info', async () => {
    const { id } = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    const user = await userService.show(id);

    expect(user).toBeTruthy();
  });

  it('should not be able to show info of nonexistent user', async () => {
    await expect(userService.show('wrong')).rejects.toBeInstanceOf(AppError);
  });

  it('should be able to update user avatar', async () => {
    const user = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    const userWithAvatar = await userService.updateAvatar({
      userId: user.id,
      avatarFilename: 'new_pic.jpg',
    });

    expect(userWithAvatar.avatar).toBe('new_pic.jpg');
  });

  it('should be able to change user avatar', async () => {
    const user = await userService.create({
      name: 'John Doe',
      email: 'john.doe@example.com',
      password: '123456',
    });

    await userService.updateAvatar({
      userId: user.id,
      avatarFilename: 'avatar.jpg',
    });

    const userWithAvatar = await userService.updateAvatar({
      userId: user.id,
      avatarFilename: 'new_pic.jpg',
    });

    expect(userWithAvatar.avatar).toBe('new_pic.jpg');
  });
});
