import User from '@entity/User';

export default class UserRegisterDTO {
  name: string;

  email: string;

  password: string;

  constructor(name: string, email: string, password: string) {
    this.name = name;
    this.email = email;
    this.password = password;
  }

  toUser(): User {
    return new User(0, this.name, this.email, this.password);
  }
}
