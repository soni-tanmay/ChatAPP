import { Injectable } from '@nestjs/common'
import { PrismaService } from 'src/prisma/prisma.service'
import { CreateChannelDto } from './dto/create-channel.dto'
import { UpdateChannelDto } from './dto/update-channel.dto'

@Injectable()
export class ChannelService {
  constructor(private prisma: PrismaService) {}
  async create(createChannelDto: CreateChannelDto) {
    const channel1 = await this.prisma.channels.create({
      data: {
        name: createChannelDto.name,
        image:
          'https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png',
        workspace: {
          connectOrCreate: {
            where: {
              name: 'Flutter Community',
            },
            create: {
              name: 'Flutter Community',
              Description: 'Join in here for amazing flutter discussions',
              image:
                'https://w7.pngwing.com/pngs/595/79/png-transparent-dart-programming-language-flutter-object-oriented-programming-flutter-logo-class-fauna-bird.png',
            },
          },
        },
        users: {
          create: [
            {
              user: {
                connect: {
                  where: {
                    id: createChannelDto.userId,
                  },
                },
              },
            },
          ],
        },
      },
    })
    return 'This action adds a new channel'
  }

  async findAll() {
    return await this.prisma.channels.findMany()
  }

  findOne(id: number) {
    return `This action returns a #${id} channel`
  }

  update(id: number, updateChannelDto: UpdateChannelDto) {
    return `This action updates a #${id} channel`
  }

  remove(id: number) {
    return `This action removes a #${id} channel`
  }
}
