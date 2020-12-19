import SessionResponseDTO from '@web/dto/SessionResponseDTO';
import UserCredentialsDTO from '@web/dto/UserCredentialsDTO';

export default interface SessionService {
  create(userCredentials: UserCredentialsDTO): Promise<SessionResponseDTO>;
}
