import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import { UserModule } from './modules/user/user.module';
import { NoteModule } from './modules/note/note.module';
import { AuthModule } from './shared/modules/auth/auth.module';
import { HashModule } from './shared/modules/hash/hash.module';
import { join } from 'path';
import databaseProviders from './shared/database/connection.config';
import { MulterModule } from '@nestjs/platform-express';
import { ServeStaticModule } from '@nestjs/serve-static';

@Module({
  imports: [
    ServeStaticModule.forRoot({
      rootPath: join(__dirname, '..', 'public'),
      serveRoot: '/files',
    }),
    MulterModule.register(),
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
