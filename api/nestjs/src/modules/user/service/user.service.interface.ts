import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';

export default interface UserServiceInterface {
  create(createUser: CreateUserDTO): Promise<User>;
}
