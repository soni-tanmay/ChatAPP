import { Controller, Get, Post, Body, Patch, Param, Delete, Put } from '@nestjs/common'
import { UsersService } from './users.service'
import { CreateUserDto } from './dto/create-user.dto'
import { UpdateUserDto } from './dto/update-user.dto'
import { RegisterDto } from 'src/auth/dto'
import { ApiTags } from '@nestjs/swagger'
import { kAvatarList } from 'src/constants/avatars-list'

@ApiTags('Users')
@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post()
  create(@Body() registerDto: RegisterDto) {
    return this.usersService.create(registerDto)
  }

  @Get()
  findAll() {
    return this.usersService.findAll()
  }

  @Get('avatars')
  getImages(): string[] {
    return kAvatarList
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.usersService.findOne(id)
  }

  @Put(':id')
  updateOne(@Param('id') id: string, @Body() request: UpdateUserDto) {
    return this.usersService.updateOne(id, request)
  }
}
