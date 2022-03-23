import { User } from './User';

export interface UserAuth {
  token: string;
  user: User;
}
