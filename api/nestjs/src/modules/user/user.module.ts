import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from 'src/shared/modules/auth/auth.module';
import { HashModule } from 'src/shared/modules/hash/hash.module';
import { UserController } from './controller/user.controller';
import { UserEntity } from './entity/user.entity';
import { UserRepository } from './repository/user.repository';
import { UserService } from './service/user.service';

@Module({
  imports: [TypeOrmModule.forFeature([UserEntity]), AuthModule, HashModule],
  controllers: [UserController],
  providers: [UserService, UserRepository],
})
export class UserModule {}
