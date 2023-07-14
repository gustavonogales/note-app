import { Module } from '@nestjs/common';
import { StorageServiceImpl } from '.';

@Module({
  providers: [StorageServiceImpl],
  exports: [StorageServiceImpl],
})
export class StorageModule {}
