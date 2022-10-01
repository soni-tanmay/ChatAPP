import { Injectable } from '@nestjs/common'
import { PrismaService } from 'src/prisma/prisma.service'
import { CreateMessageDto } from './dto/create-message.dto'
import { GetMessageDto } from './dto/get-message.dto'

@Injectable()
export class MessageService {
  constructor(private prisma: PrismaService) {}

  async create(request: CreateMessageDto | any) {
    const message = await this.prisma.messages.create({
      data: {
        message: request.data.payload.message,
        image: request.user.profilePic,
        channel: {
          connect: {
            id: request.data.payload.channelId,
          },
        },
        user: {
          connect: {
            id: request.data.payload.senderId,
          },
        },
      },
    })
  }

  async findAll(request: GetMessageDto) {
    const result = await this.prisma.$queryRaw`
      SELECT 
        "Messages"."id", 
        "Messages"."message",
        "Messages"."image",
        "Messages"."createdAt", 
        "Messages"."channelId",
        "Users"."userName"
      FROM "Messages" inner join "Users" on "Messages"."senderId" = "Users"."id"
      WHERE "Messages"."channelId" = ${request.channelId}
      ORDER BY "Messages"."createdAt" DESC;
    `
    return result
  }
}
