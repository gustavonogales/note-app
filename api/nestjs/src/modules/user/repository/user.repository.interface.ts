import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';

export default interface UserRepositoryInterface {
  create(createUser: CreateUserDTO): Promise<User>;
}
