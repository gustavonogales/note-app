import { Module } from '@nestjs/common';
import { HashProviderImpl } from 'src/shared/provider/HashProvider';
import { UserController } from './controller/user.controller';
import { UserRepositoryImpl } from './repository/user.repository.impl';
import { UserServiceImpl } from './service/user.service.impl';

@Module({
  controllers: [UserController],
  providers: [UserServiceImpl, UserRepositoryImpl, HashProviderImpl],
})
export class UserModule {}
