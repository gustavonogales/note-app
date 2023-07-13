import {
  Body,
  Controller,
  Get,
  Patch,
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
import { Request as ExpressRequest } from 'express';

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
  @Patch()
  async update(@Request() request: any): Promise<User> {
    const id = request.user.sub;
    console.log(request);
    const { name, email, password } = request.body;

    const userUpdate = {
      id,
      name,
      email,
      password,
    } as UpdateUserDTO;

    const user = await this.userService.update(userUpdate);

    return classToClass(user);
  }

  @UseGuards(JwtAuthGuard)
  @Get()
  async show(@Request() request: any): Promise<User> {
    const id = request.user.sub;

    const user = await this.userService.show(id);

    return classToClass(user);
  }

  @UseGuards(JwtAuthGuard)
  @Patch('/avatar')
  async updateAvatar(@Request() request: ExpressRequest): Promise<void> {
    // log(request.);
  }
}
