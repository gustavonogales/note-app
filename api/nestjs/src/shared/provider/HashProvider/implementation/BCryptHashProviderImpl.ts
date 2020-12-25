import { Injectable } from '@nestjs/common';
import { hash, compare } from 'bcryptjs';
import HashProvider from '../adapter/HashProvider';

@Injectable()
export default class BCryptHashProvider implements HashProvider {
  public async generateHash(payload: string): Promise<string> {
    return hash(payload, 8);
  }

  public async compareHash(payload: string, hashed: string): Promise<boolean> {
    return compare(payload, hashed);
  }
}
