import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';

export default interface UserService {
  create(createUser: CreateUserDTO): Promise<User>;
}
