import { Exclude, Expose } from 'class-transformer';

export default class User {
  public readonly id: string;

  public readonly name: string;

  public readonly email: string;

  @Exclude()
  public readonly password: string;

  @Exclude()
  public readonly avatar?: string;

  @Expose({ name: 'avatar_url' })
  getAvatarUrl(): string | null {
    if (!this.avatar) {
      return null;
    }

    return `http://localhost:${process.env.APP_PORT}/files/${this.avatar}`;
  }

  constructor(
    id: string,
    name: string,
    email: string,
    password: string,
    avatar: string,
  ) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.password = password;
    this.avatar = avatar;
  }
}
