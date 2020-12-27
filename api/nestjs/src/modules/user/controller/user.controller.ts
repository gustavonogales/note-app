import { Body, Controller, Get, Post } from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { CreateUserDTO } from '../dto/create-user.dto';
import User from '../model/user.model';
import { UserService } from '../service/user.service';

@Controller('user')
export class UserController {
  constructor(private userService: UserService) {}

  @Post()
  async create(@Body() user: User): Promise<User> {
    const { id, name, email, avatar, password } = await this.userService.create(
      user,
    );
    const userCreated = new User(id, name, email, password, avatar);
    return classToClass(userCreated);
  }
}
