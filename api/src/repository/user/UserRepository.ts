import User from '@entity/User';

export default interface UserRepository {
  create(user: User): Promise<User>;
}
