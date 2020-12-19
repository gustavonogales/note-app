import User from '@entity/User';
import UserRegisterDTO from '@web/dto/UserRegisterDTO';

export default interface UserRepository {
  create(userRegister: UserRegisterDTO): Promise<User>;
  findById(id: string): Promise<User | undefined>;
  findByEmail(email: string): Promise<User | undefined>;
  save(user: User): Promise<User>;
}
