import { Injectable } from '@nestjs/common';
import { SessionCreateDTO } from '../dto/session-create.dto';
import { Session } from '../model/session.model';
import SessionServiceInterface from './session.service.interface';

@Injectable()
export class SessionService implements SessionServiceInterface {
  create({ email, password }: SessionCreateDTO): Promise<Session> {
    throw new Error('Method not implemented.');
  }
}
