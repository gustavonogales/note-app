import {
  Body,
  Controller,
  Get,
  Post,
  Put,
  Request,
  UseGuards,
} from '@nestjs/common';
import { classToClass } from 'class-transformer';
import { JwtAuthGuard } from 'src/shared/modules/auth/guard/jwt-auth.guard';
import UpdateUserDTO from '../dto/update-user.dto';
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

  @UseGuards(JwtAuthGuard)
  @Put()
  async update(@Request() request: any): Promise<User> {
    const id = request.user.id;
    const { name, email, password, old_password } = request.body;

    const userUpdate = {
      id,
      name,
      email,
      password,
      oldPassword: old_password,
    } as UpdateUserDTO;

    const user = await this.userService.update(userUpdate);

    return classToClass(user);
  }

  @UseGuards(JwtAuthGuard)
  @Get()
  async show(@Request() request: any): Promise<User> {
    const id = request.user.id;

    const user = await this.userService.show(id);

    return classToClass(user);
  }
}
