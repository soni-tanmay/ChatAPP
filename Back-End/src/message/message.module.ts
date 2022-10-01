import { Module } from '@nestjs/common'
import { PrismaModule } from 'src/prisma/prisma.module'
import { UsersModule } from 'src/users/users.module'
import { MessageController } from './message.controller'
import { MessageService } from './message.service'
import { MessageSocketGateway } from './message.socket.gateway'

@Module({
  imports: [PrismaModule, UsersModule],
  controllers: [MessageController],
  providers: [MessageService, MessageSocketGateway],
})
export class MessageModule {}
