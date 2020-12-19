import User from '@entity/User';

export default interface SessionResponseDTO {
  user: User;
  token: string;
}
