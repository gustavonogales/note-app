import {
  Controller,
  Get,
  Post,
  UseGuards,
  Request,
  Param,
} from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { JwtAuthGuard } from 'src/shared/modules/auth/guard/jwt-auth.guard';
import Note from '../model/note.model';
import { NoteService } from '../service/note.service';

@Controller('note')
export class NoteController {
  constructor(private noteService: NoteService) {}

  @UseGuards(JwtAuthGuard)
  @Get()
  async index(@Request() request: any): Promise<Note[]> {
    const user_id = request.user.id;

    const notes = this.noteService.index(user_id);

    return classToClass(notes);
  }

  @UseGuards(JwtAuthGuard)
  @Get(':id')
  async show(@Param() id: string) {
    const note = this.noteService.show(id);

    return classToClass(note);
  }

  @UseGuards(JwtAuthGuard)
  @Post()
  async create(@Request() request: any): Promise<Note> {
    const user_id = request.user.id;
    const { title, text } = request.body;

    const createNote = {
      user_id,
      title,
      text,
    };

    const note = await this.noteService.create(createNote);

    return classToClass(note);
  }
}
