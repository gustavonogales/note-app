import User from '@entity/User';

export default interface UserService {
  create(user: User): Promise<User>;
}
