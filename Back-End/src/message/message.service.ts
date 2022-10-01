import { Injectable } from '@nestjs/common'
import { PrismaService } from 'src/prisma/prisma.service'
import { CreateMessageDto } from './dto/create-message.dto'
import { GetMessageDto } from './dto/get-message.dto'

@Injectable()
export class MessageService {
  constructor(private prisma: PrismaService) {}

  async create(request: CreateMessageDto) {
    const message = await this.prisma.messages.create({
      data: {
        message: request.message,
        image:
          'https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png',
        channel: {
          connect: {
            id: request.channelId,
          },
        },
        user: {
          connect: {
            id: request.senderId,
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
