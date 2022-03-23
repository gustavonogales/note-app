interface UserUpdateCredentials {
  name: string;
  email: string;
  password?: string;
  old_password?: string;
}

export default UserUpdateCredentials;
