import { Body, Controller, Get, Post } from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';
import { UserService } from '../service/user.service';

@Controller('user')
export class UserController {
  constructor(private userService: UserService) {}

  @Post()
  async create(@Body() createUser: CreateUserDTO): Promise<User> {
    const user = await this.userService.create(createUser);
    return classToClass(user);
  }
}
