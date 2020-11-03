import { container } from 'tsyringe';
import UserRepository from '@repository/adapter/UserRepository';
import UserRepositoryImpl from '@repository/UserRepositoryImpl';

container.registerSingleton<UserRepository>(
  'UserRepository',
  UserRepositoryImpl,
);
