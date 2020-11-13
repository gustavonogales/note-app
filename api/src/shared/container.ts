import { container } from 'tsyringe';
import './provider';
import UserRepository from '@repository/user/UserRepository';
import UserRepositoryImpl from '@repository/user/UserRepositoryImpl';
import NoteRepository from '@repository/note/NoteRepository';
import NoteRepositoryImpl from '@repository/note/NoteRepositoryImpl';

container.registerSingleton<UserRepository>(
  'UserRepository',
  UserRepositoryImpl,
);

container.registerSingleton<NoteRepository>(
  'NoteRepository',
  NoteRepositoryImpl,
);
