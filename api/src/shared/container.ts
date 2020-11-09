import { container } from 'tsyringe';
import './provider';
import UserRepository from '@repository/user/UserRepository';
import UserRepositoryImpl from '@repository/user/UserRepositoryImpl';

container.registerSingleton<UserRepository>(
  'UserRepository',
  UserRepositoryImpl,
);
