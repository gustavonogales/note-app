import UpdateUserAvatarDTO from '../dto/update-user-avatar.dto';
import UpdateUserDTO from '../dto/update-user.dto';
import User from '../model/user.model';

export default interface UserServiceInterface {
  create(user: User): Promise<User>;
  update(user: UpdateUserDTO): Promise<User>;
  show(id: string): Promise<User>;
  delete(id: string): Promise<void>;
  updateAvatar(data: UpdateUserAvatarDTO): Promise<User>;
  updateAvatarWithBase64(id: string, data: string): Promise<User>;
}
