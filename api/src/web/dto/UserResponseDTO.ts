import User from '@entity/User';

export default class UserResponseDTO {
  id: number;

  name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }

  static fromUser(user: User): UserResponseDTO {
    return new UserResponseDTO(user.id, user.name);
  }
}
