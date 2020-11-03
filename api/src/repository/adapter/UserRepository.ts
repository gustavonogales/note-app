import User from '@entity/User';
import UserDTO from '@dto/UserDTO';

export default interface UserRepository {
  create(data: UserDTO): Promise<User>;
}
