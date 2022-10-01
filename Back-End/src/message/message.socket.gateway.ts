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
<<<<<<< HEAD
    socket.on('sendMessage', async data => {
      const jsonData = JSON.parse(data)
      if (jsonData.message.trim() !== '') {
        const { password, ...user } = await this.usersService.findOne(jsonData.senderId)
        const socketPayload = {
          user: user,
          payload: {
            dateTime: new Date().toLocaleString('en-US', {
              timeZone: 'Asia/Kolkata',
            }),
            ...jsonData,
          },
        }
        socket.emit(`${jsonData.channelId}`, socketPayload)
        await this.messageService.create({ user: user, data: socketPayload })
      }
=======
    socket.on('sendMessage', async (data: CreateMessageDto) => {
      console.log('sendMessageData', data)
      const { password, ...user } = await this.usersService.findOne(data.senderId)
      socket.emit(`${data.channelId}`, { message: data })
      await this.messageService.create(data)
>>>>>>> fa089c8f20103ccc0be2a4d356cf0ec4359f446b
    })
  }
  async handleDisconnect(@ConnectedSocket() socket: MySocket) {
    console.log(`[ ${socket?.nickname ?? socket.id} ] disconnected`)
  }
}
