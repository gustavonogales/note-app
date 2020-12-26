import { Injectable } from '@nestjs/common';
import { hash, compare } from 'bcryptjs';
import HashService from '../adapter/HashService.interface';

@Injectable()
export default class BCryptHashService implements HashService {
  public async generateHash(payload: string): Promise<string> {
    return hash(payload, 8);
  }

  public async compareHash(payload: string, hashed: string): Promise<boolean> {
    return compare(payload, hashed);
  }
}
