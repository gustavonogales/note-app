export default class User {
  private _id: string;

  private _name: string;

  private _email: string;

  private _password?: string;

  private _oldPassword?: string;

  constructor(
    id: string,
    name: string,
    email: string,
    password?: string,
    oldPassword?: string,
  ) {
    this._id = id;
    this._name = name;
    this._email = email;
    this._password = password;
    this._oldPassword = oldPassword;
  }

  get id(): string {
    return this._id;
  }

  get name(): string {
    return this._name;
  }

  get email(): string {
    return this._email;
  }

  get password(): string | undefined {
    return this._password;
  }

  get oldPassword(): string | undefined {
    return this._oldPassword;
  }
}
