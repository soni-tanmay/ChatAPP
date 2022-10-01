import { Injectable } from '@nestjs/common'
import { RegisterDto } from 'src/auth/dto'
import { PrismaService } from 'src/prisma/prisma.service'
@Injectable()
export class UsersService {
  constructor(private readonly prisma: PrismaService) {}

  async create(RegisterDto: RegisterDto) {
    try {
      const userRegistrationData = {
        name: RegisterDto.name,
        userName: RegisterDto.username,
        email: RegisterDto.email,
        password: RegisterDto.password,
        profilePic: `https://ui-avatars.com/api/?name=${RegisterDto.name}`,
        workspaces: {
          create: [
            {
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
            },
          ],
        },
        channels: {
          create: [
            {
              channel: {
                connectOrCreate: {
                  where: {
                    id: 'c05bc5bd-598e-4230-85c3-36b49cc3e1ef',
                  },
                  create: {
                    name: 'General',
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
                  },
                },
              },
            },
          ],
        },
      }
      console.log(userRegistrationData)
      return await this.prisma.users.create({ data: userRegistrationData })
    } catch (error) {
      console.log(error)
      throw error
    }
  }

  findAll() {
    return this.prisma.users.findMany()
  }

  findOne(id: string) {
    return this.prisma.users.findUnique({ where: { id } })
  }

  findOneByEmail(email: string) {
    return this.prisma.users.findUnique({ where: { email } })
  }

  findOneByUserName(userName: string) {
    return this.prisma.users.findUnique({ where: { userName } })
  }
}
