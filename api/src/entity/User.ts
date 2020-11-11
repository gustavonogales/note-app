export default class User {
  public readonly id: string;

  public readonly name: string;

  public readonly email: string;

  public readonly password: string;

  constructor(id: string, name: string, email: string, password: string) {
    this.id = id;
    this.name = name;
    this.email = email;
    this.password = password;
  }
}
