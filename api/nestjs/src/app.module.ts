import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { UserModule } from './modules/user/user.module';
import { NoteModule } from './modules/note/note.module';
import { AuthModule } from './shared/modules/auth/auth.module';
import { HashModule } from './shared/modules/hash/hash.module';
import databaseProviders from './shared/database/connection.config';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
      load: [databaseProviders],
    }),
    TypeOrmModule.forRoot(databaseProviders() as TypeOrmModuleOptions),
    UserModule,
    NoteModule,
    AuthModule,
    HashModule,
  ],
})
export class AppModule {}
