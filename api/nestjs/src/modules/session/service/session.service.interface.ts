import { SessionCreateDTO } from '../dto/session-create.dto';
import { Session } from '../model/session.model';

export default interface SessionServiceInterface {
  create(credentials: SessionCreateDTO): Promise<Session>;
}
