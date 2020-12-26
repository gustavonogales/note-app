import { Module } from '@nestjs/common';
import { HashServiceImpl } from 'src/shared/service/HashService';
import { UserController } from './controller/user.controller';
import { UserRepository } from './repository/user.repository';
import { UserService } from './service/user.service';

@Module({
  controllers: [UserController],
  providers: [UserService, UserRepository, HashServiceImpl],
})
export class UserModule {}
