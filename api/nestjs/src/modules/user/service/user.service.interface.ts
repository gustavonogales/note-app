import UpdateUserDTO from '../dto/update-user.dto';
import User from '../model/user.model';

export default interface UserServiceInterface {
  create(user: User): Promise<User>;
  update(user: UpdateUserDTO): Promise<User>;
  show(id: string): Promise<User>;
}
