import { ApiProperty } from '@nestjs/swagger'

export class CreateChannelDto {
  @ApiProperty({ required: true })
  name: string
  @ApiProperty({ required: true })
  description: string
  @ApiProperty({ required: true })
  userId: string
  @ApiProperty({ required: false })
  image: string
  @ApiProperty({ required: false })
  workspaceId: string
}
