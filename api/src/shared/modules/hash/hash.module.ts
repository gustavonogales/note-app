import { Module } from '@nestjs/common';
import { HashServiceImpl } from '.';

@Module({
  providers: [HashServiceImpl],
  exports: [HashServiceImpl],
})
export class HashModule {}
