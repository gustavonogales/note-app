import { AxiosResponse } from 'axios';
import User from '../models/User';
import UserUpdateCredentials from '../models/UserUpdateCredentials';
import api from '../utils/api';

export class UserService {
  static updateUser(user: UserUpdateCredentials): Promise<AxiosResponse<User>> {
    return api.put('/user', user);
  }
}
