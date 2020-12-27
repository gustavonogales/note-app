import { UserCredentialsDTO } from '../dto/user-credentials.dto';
import { Auth } from '../model/auth.model';

export default interface AuthServiceInterface {
  create(credentials: UserCredentialsDTO): Promise<Auth>;
}
