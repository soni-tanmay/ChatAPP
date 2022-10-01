import { Body, Controller, Get, Post, Query } from '@nestjs/common'
import { ApiTags } from '@nestjs/swagger'
import { CreateMessageDto } from './dto/create-message.dto'
import { GetMessageDto } from './dto/get-message.dto'
import { MessageService } from './message.service'

@ApiTags('Messages')
@Controller('message')
export class MessageController {
  constructor(private readonly messageService: MessageService) {}

  @Post()
  async createMessage(@Body() request: CreateMessageDto) {
    await this.messageService.create(request)
  }

  @Get()
  async getMessages(@Query() query: GetMessageDto) {
    return await this.messageService.findAll(query)
  }
}
