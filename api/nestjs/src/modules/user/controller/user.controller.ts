import { Body, Controller, Get, Post } from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';
import { UserServiceImpl } from '../service/user.service.impl';

@Controller('user')
export class UserController {
  constructor(private userService: UserServiceImpl) {}

  @Post()
  async create(@Body() createUser: CreateUserDTO): Promise<User> {
    const user = await this.userService.create(createUser);
    return classToClass(user);
  }
}
