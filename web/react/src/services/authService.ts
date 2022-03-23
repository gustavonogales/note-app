import { AxiosResponse } from 'axios';
import UserAuth from '../models/UserAuth';
import UserSignInCredentials from '../models/UserSignInCredentials';
import api from '../utils/api';

export class AuthService {
  static signIn({
    email,
    password,
  }: UserSignInCredentials): Promise<AxiosResponse<UserAuth>> {
    return api.post('session', {
      email,
      password,
    });
  }
}
