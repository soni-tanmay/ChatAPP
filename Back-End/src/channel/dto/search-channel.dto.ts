import { ApiProperty } from '@nestjs/swagger'

export class SearchChannelDTO {
  @ApiProperty({ required: true })
  name: string
}