import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { JwtModule } from '@nestjs/jwt';
import { PassportModule } from '@nestjs/passport';
import { TypeOrmModule } from '@nestjs/typeorm';
import { UserEntity } from 'src/modules/user/entity/user.entity';
import { UserRepository } from 'src/modules/user/repository/user.repository';
import { HashModule } from '../hash/hash.module';
import { AuthController } from './controller/auth.controller';
import { AuthService } from './service/auth.service';
import { JwtStrategy } from './strategy/jwt.strategy';
import { RefreshJwtStrategy } from './strategy/jwt.refresh.strategy';

@Module({
  imports: [
    ConfigModule,
    TypeOrmModule.forFeature([UserEntity]),
    PassportModule,
    JwtModule.registerAsync({
      imports: [ConfigModule],
      useFactory: async (configService: ConfigService) => ({
        secret: configService.get('APP_JWT_SECRET'),
      }),
      inject: [ConfigService],
    }),
    HashModule,
  ],
  controllers: [AuthController],
  providers: [UserRepository, AuthService, JwtStrategy, RefreshJwtStrategy],
})
export class AuthModule {}
