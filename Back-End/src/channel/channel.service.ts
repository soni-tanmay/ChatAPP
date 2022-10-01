import { Injectable } from '@nestjs/common'
import { PrismaService } from 'src/prisma/prisma.service'
import { CreateChannelDto } from './dto/create-channel.dto'
import { UpdateChannelDto } from './dto/update-channel.dto'

@Injectable()
export class ChannelService {
  constructor(private prisma: PrismaService) {}
  async create(createChannelDto: CreateChannelDto, userId: string) {
    const channel = await this.prisma.channels.create({
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
                  id: '04bfadda-2b37-4b40-ba1c-26bfbd181fc9',
                },
              },
            },
          ],
        },
      },
    })
    return channel
  }

  async findAll(userId: string) {
    try {
      let channels = await this.prisma.channels.findMany({
        where: {
          users: {
            some: {
              userId: '04bfadda-2b37-4b40-ba1c-26bfbd181fc9',
            },
          },
        },
      })
      return { message: 'success', data: channels }
    } catch (err) {
      return { message: 'error', data: err }
    }
  }

  async findTrending() {
    try {
      let channels = await this.prisma.channels.findMany({
        orderBy: {
          messages: {
            _count: 'desc',
          },
        }
      });

      return { message: 'success', data: channels }
    } catch (err) {
      return { message: 'error', data: err }
    }
  }

  update(id: number, updateChannelDto: UpdateChannelDto) {
    return `This action updates a #${id} channel`
  }

  remove(id: number) {
    return `This action removes a #${id} channel`
  }
}
