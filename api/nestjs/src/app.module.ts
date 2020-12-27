import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { UserModule } from './modules/user/user.module';
import databaseProviders from './shared/database/connection.config';

@Module({
  imports: [
    UserModule,
    ConfigModule.forRoot({
      isGlobal: true,
      load: [databaseProviders],
    }),
    TypeOrmModule.forRoot(databaseProviders() as TypeOrmModuleOptions),
  ],
})
export class AppModule {}
