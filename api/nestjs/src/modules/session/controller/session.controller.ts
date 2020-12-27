import { Body, Controller, Post } from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { SessionCreateDTO } from '../dto/session-create.dto';
import { Session } from '../model/session.model';
import { SessionService } from '../service/session.service';

@Controller('session')
export class SessionController {
  constructor(private sessionService: SessionService) {}

  @Post()
  async create(
    @Body() { email, password }: SessionCreateDTO,
  ): Promise<Session> {
    const { user, token } = await this.sessionService.create({
      email,
      password,
    });

    return new Session(classToClass(user), token);
  }
}
