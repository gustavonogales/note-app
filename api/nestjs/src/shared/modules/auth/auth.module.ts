import { Module } from '@nestjs/common';
import { JwtModule, JwtModuleOptions } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserDAO } from 'src/modules/user/entity/user.entity';
import { UserRepository } from 'src/modules/user/repository/user.repository';
import { HashModule } from '../hash/hash.module';
import { AuthController } from './controller/auth.controller';
import { AuthService } from './service/auth.service';
import { authConfig } from './util/auth.config';
import { JwtStrategy } from './util/jwt.strategy';

@Module({
  imports: [
    TypeOrmModule.forFeature([UserDAO]),
    PassportModule,
    JwtModule.register(authConfig as JwtModuleOptions),
    HashModule,
  ],
  controllers: [AuthController],
  providers: [UserRepository, AuthService, JwtStrategy],
})
export class AuthModule {}
