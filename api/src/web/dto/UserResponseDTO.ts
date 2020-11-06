import User from '@entity/User';

export default class UserResponseDTO {
  id: string;

  name: string;

  constructor(id: string, name: string) {
    this.id = id;
    this.name = name;
  }

  static fromUser(user: User): UserResponseDTO {
    return new UserResponseDTO(user.id, user.name);
  }
}
