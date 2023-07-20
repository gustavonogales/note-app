import {
  Controller,
  Get,
  Post,
  UseGuards,
  Request,
  Param,
  Delete,
  Patch,
} from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { JwtAuthGuard } from 'src/shared/modules/auth/guard/jwt-auth.guard';
import { UpdateNote } from '../dto/update-note.dto';
import Note from '../model/note.model';
import { NoteService } from '../service/note.service';

@Controller('note')
@UseGuards(JwtAuthGuard)
export class NoteController {
  constructor(private noteService: NoteService) {}

  @Get()
  async index(@Request() request: any): Promise<Note[]> {
    const user_id: string = request.user.sub;

    const notes = await this.noteService.index(user_id);

    return classToClass(notes);
  }

  @Get(':id')
  async show(@Param() id: string) {
    const note = await this.noteService.show(id);

    return classToClass(note);
  }

  @Post()
  async create(@Request() request: any): Promise<Note> {
    const user_id: string = request.user.sub;
    const { title, text, color } = request.body;

    const createNote = {
      user_id,
      title,
      text,
      color,
    };

    const note = await this.noteService.create(createNote);

    return classToClass(note);
  }

  @Delete(':id')
  async delete(@Request() request: any): Promise<void> {
    const { id } = request.params;

    await this.noteService.delete(id);
  }

  @Patch(':id')
  async update(@Request() request: any): Promise<Note> {
    const user_id = request.user.sub;
    const { title, text, color } = request.body;
    const { id } = request.params;

    const updateNote = {
      user_id,
      id,
      title,
      text,
      color,
    } as UpdateNote;

    const note = await this.noteService.update(updateNote);

    return classToClass(note);
  }
}
