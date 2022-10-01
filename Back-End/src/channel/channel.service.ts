import { Injectable } from '@nestjs/common'
import { PrismaService } from 'src/prisma/prisma.service'
import { CreateChannelDto } from './dto/create-channel.dto'
import { SearchChannelDTO } from './dto/search-channel.dto'

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
                  id: userId,
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
              userId: userId,
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

  async searchChannels(query: SearchChannelDTO) {
    console.log(query.name);
    try {
      let channels = await this.prisma.channels.findMany({
        where: {
          name: {
            contains: query.name,
          }
        }
      });

      return { message: 'success', data: channels }
    } catch (err) {
      return { message: 'error', data: err }
    }
  }

}
