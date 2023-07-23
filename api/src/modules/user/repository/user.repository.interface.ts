import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';

export default interface UserRepositoryInterface {
  create(createUser: CreateUserDTO): Promise<User>;
  findById(id: string): Promise<User | undefined>;
  findByEmail(email: string): Promise<User | undefined>;
  save(user: User): Promise<User>;
}
