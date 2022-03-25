import { AxiosResponse } from 'axios';
import { User, UserUpdateCredentials, UserSignUp } from '@/types';
import { api } from '@/utils';

export class UserService {
  private static resource = '/user';

  static updateUser(user: UserUpdateCredentials): Promise<AxiosResponse<User>> {
    return api.put(this.resource, user);
  }

  static createUser(user: UserSignUp): Promise<AxiosResponse<User>> {
    return api.post(this.resource, user);
  }
}
