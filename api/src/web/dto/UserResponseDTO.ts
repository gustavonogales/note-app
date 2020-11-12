/* eslint-disable camelcase */
import User from '@entity/User';
import { Exclude, Expose } from 'class-transformer';

export default class UserResponseDTO {
  id: string;

  name: string;

  @Exclude()
  avatar?: string;

  constructor(id: string, name: string, avatar: string) {
    this.id = id;
    this.name = name;
    this.avatar = avatar;
  }

  @Expose({ name: 'avatar_url' })
  getAvatarUrl(): string | null {
    if (!this.avatar) {
      return null;
    }

    return `http://localhost:${process.env.APP_PORT}/files/${this.avatar}`;
  }

  static fromUser(user: User): UserResponseDTO {
    return new UserResponseDTO(user.id, user.name, user.avatar);
  }
}
