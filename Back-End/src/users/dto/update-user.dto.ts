import { PartialType } from '@nestjs/swagger'
import { IsString } from 'class-validator'
import { CreateUserDto } from './create-user.dto'

export class UpdateUserDto {
  @IsString()
  image?: string
}
