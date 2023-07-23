import {
  Body,
  Controller,
  Get,
  HttpStatus,
  Post,
  Request,
  UseGuards,
} from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { log } from 'console';
import { UserCredentialsDTO } from 'src/shared/modules/auth/dto/user-credentials.dto';
import { JwtAuthGuard } from 'src/shared/modules/auth/guard/jwt-auth.guard';
import { Auth } from 'src/shared/modules/auth/model/auth.model';
import { AuthService } from 'src/shared/modules/auth/service/auth.service';

@Controller('session')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Post()
  async create(@Body() { email, password }: UserCredentialsDTO): Promise<Auth> {
    const auth = await this.authService.create({
      email,
      password,
    });

    return auth;
  }

  @UseGuards(AuthGuard('jwt-refresh'))
  @Post('/refresh')
  async refresh(@Request() req) {
    const { email, sub } = req.user;
    const auth = await this.authService.recreate({ email, id: sub });
    return auth;
  }
}
