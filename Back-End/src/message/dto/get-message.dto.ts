import { IsOptional, IsString } from 'class-validator'

export class GetMessageDto {
  @IsString()
  channelId: string

  @IsString()
  @IsOptional()
  userId?: string
}
