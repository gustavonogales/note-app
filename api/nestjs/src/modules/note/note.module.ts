import { Module } from '@nestjs/common';
import { AuthModule } from 'src/shared/modules/auth/auth.module';
import { NoteController } from './controller/note.controller';
import { NoteRepository } from './repository/note.repository';
import { NoteService } from './service/note.service';

@Module({
  imports: [AuthModule],
  controllers: [NoteController],
  providers: [NoteService, NoteRepository],
})
export class NoteModule {}
