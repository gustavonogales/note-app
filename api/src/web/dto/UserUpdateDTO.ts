export default interface UserUpdateDTO {
  id: string;
  name: string;
  email: string;
  password?: string;
  oldPassword?: string;
}
