import User from '@entity/User';
import UserDTO from '@dto/UserDTO';

export default interface UserService {
  create(data: UserDTO): Promise<User>;
}
