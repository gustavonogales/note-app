import SessionResponseDTO from '@web/dto/SessionResponseDTO';

export default interface SessionService {
  create(email: string, password: string): Promise<SessionResponseDTO>;
}
