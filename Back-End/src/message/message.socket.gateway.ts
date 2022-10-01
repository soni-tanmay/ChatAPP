import { ConnectedSocket, WebSocketGateway } from '@nestjs/websockets'
import { Socket } from 'socket.io'
import { UsersService } from 'src/users/users.service'
import { CreateMessageDto } from './dto/create-message.dto'
import { MessageService } from './message.service'
export type MySocket = Socket & { nickname: string }

@WebSocketGateway({ cors: true })
export class MessageSocketGateway {
  constructor(private readonly messageService: MessageService, private readonly usersService: UsersService) {}

  handleConnection(@ConnectedSocket() socket: MySocket) {
    console.log(`[ ${socket.id} ] connected`)
    socket.on('sendMessage', async (data: CreateMessageDto) => {
      console.log('sendMessageData', data)
      const { password, ...user } = await this.usersService.findOne(data.senderId)
      socket.emit(`${data.channelId}`, { message: data })
      await this.messageService.create(data)
    })
  }
  async handleDisconnect(@ConnectedSocket() socket: MySocket) {
    console.log(`[ ${socket?.nickname ?? socket.id} ] disconnected`)
  }
}
