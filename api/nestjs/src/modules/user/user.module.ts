import { Module } from '@nestjs/common';
import { HashProviderImpl } from 'src/shared/provider/HashProvider';
import { UserController } from './controller/user.controller';
import { UserRepository } from './repository/user.repository';
import { UserServiceImpl } from './service/user.service.impl';

@Module({
  controllers: [UserController],
  providers: [UserServiceImpl, UserRepository, HashProviderImpl],
})
export class UserModule {}
