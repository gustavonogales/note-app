import { Module } from '@nestjs/common';
import { NoteController } from './controller/note.controller';

@Module({
  controllers: [NoteController],
})
export class NoteModule {}
