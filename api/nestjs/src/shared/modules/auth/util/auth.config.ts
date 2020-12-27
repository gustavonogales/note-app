import { JwtModuleOptions } from '@nestjs/jwt';

export const authConfig: JwtModuleOptions = {
  secret: 'secret',
  signOptions: { expiresIn: '1d' },
};
