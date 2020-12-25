import { Test, TestingModule } from '@nestjs/testing';
import { UserServiceImpl } from './user.service.impl';

describe('UserService', () => {
  let service: UserServiceImpl;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [UserServiceImpl],
    }).compile();

    service = module.get<UserServiceImpl>(UserServiceImpl);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
