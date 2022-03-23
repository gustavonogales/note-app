import { AxiosResponse } from 'axios';
import { UserAuth, UserSignInCredentials } from '../types';
import { api } from '../utils';

export class AuthService {
  private static resource = '/session';

  static signIn({ email, password }: UserSignInCredentials): Promise<AxiosResponse<UserAuth>> {
    return api.post(this.resource, {
      email,
      password,
    });
  }
}
