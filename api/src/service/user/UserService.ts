import User from '@entity/User';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';
import UserUpdateDTO from '@web/dto/UserUpdateDTO';

export default interface UserService {
  create(userRegister: UserRegisterDTO): Promise<User>;
  update(userUpdate: UserUpdateDTO): Promise<User>;
  show(id: string): Promise<User | undefined>;
}
