import { ConnectedSocket, WebSocketGateway } from '@nestjs/websockets'
import { Socket } from 'socket.io'
import { UsersService } from 'src/users/users.service'
import { MessageService } from './message.service'
export type MySocket = Socket & { nickname: string }

@WebSocketGateway({ cors: true })
export class MessageSocketGateway {
  constructor(private readonly messageService: MessageService, private readonly usersService: UsersService) {}

  handleConnection(@ConnectedSocket() socket: MySocket) {
    console.log(`[ ${socket.id} ] connected`)

    socket.on('subscribeChannel', async data=> {
      const jsonData = JSON.parse(data);
      socket.join(jsonData.channelId);
    });
    socket.on('sendMessage', async data => {
      const jsonData = JSON.parse(data)
      console.log(jsonData)
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
        socket.to(`${jsonData.channelId}`).emit(`${jsonData.channelId}`, socketPayload);
        socket.emit(`${jsonData.channelId}`, socketPayload);
        await this.messageService.create({ user: user, data: socketPayload })
      }
    });
  }
  async handleDisconnect(@ConnectedSocket() socket: MySocket) {
    console.log(`[ ${socket?.nickname ?? socket.id} ] disconnected`)
  }
}
