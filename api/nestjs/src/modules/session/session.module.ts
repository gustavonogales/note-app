import { Module } from '@nestjs/common';
import { HashServiceImpl } from 'src/shared/service/HashService';
import { SessionController } from './controller/session.controller';
import { SessionService } from './service/session.service';

@Module({
  controllers: [SessionController],
  providers: [HashServiceImpl, SessionService],
})
export class SessionModule {}
