import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { AuthModule } from 'src/shared/modules/auth/auth.module';
import { NoteController } from './controller/note.controller';
import { NoteEntity } from './entity/note.entity';
import { NoteRepository } from './repository/note.repository';
import { NoteService } from './service/note.service';

@Module({
  imports: [TypeOrmModule.forFeature([NoteEntity]), AuthModule],
  controllers: [NoteController],
  providers: [NoteService, NoteRepository],
})
export class NoteModule {}
