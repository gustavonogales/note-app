import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { HashServiceImpl } from 'src/shared/service/HashService';
import { UserController } from './controller/user.controller';
import { UserDAO } from './entity/user.entity';
import { UserRepository } from './repository/user.repository';
import { UserService } from './service/user.service';

@Module({
  imports: [TypeOrmModule.forFeature([UserDAO])],
  controllers: [UserController],
  providers: [UserService, UserRepository, HashServiceImpl],
})
export class UserModule {}
