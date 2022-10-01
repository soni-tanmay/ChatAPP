import { HttpException, HttpStatus, Injectable } from '@nestjs/common'
import { JwtService } from '@nestjs/jwt'
import { UsersService } from 'src/users/users.service'
import * as bcrypt from 'bcrypt'
import { PrismaService } from 'src/prisma/prisma.service'
// import { UserEntity } from 'src/users/entity/user.entity';
import { RegisterDto, UserDto } from './dto'

@Injectable()
export class AuthService {
  constructor(private userService: UsersService, private jwtService: JwtService, private prisma: PrismaService) {}

  async validateUser(email: string, password: string): Promise<any> {
    const user = await this.userService.findOneByEmail(email)
    console.log('body', user)
    const match = await bcrypt.compare(password, user.password)
    if (user && match) {
      const { password, ...result } = user
      return result
    }
    return null
  }

  async login(user) {
    const existingUser = await this.validateUser(user.email, user.password)
    if (!existingUser) {
      throw new HttpException('User not found with the given credentials', HttpStatus.NOT_FOUND)
    }
    const tokens = await this.updateRefreshTokenHash(user)
    return { existingUser, tokens }
  }

  async refreshToken(userId: string, refreshToken: string) {
    const user = await this.userService.findOne(userId)
    if (!user) {
      throw new Error('User not found')
    }
    // await bcrypt.compare(refreshToken, user.refreshToken, (err, res) => {
    //   if (err) {
    //     throw new Error('Refresh token is invalid')
    //   }
    //   return res
    // })
    const tokens = await this.updateRefreshTokenHash(user)
    return tokens
  }

  async register(user: RegisterDto) {
    try {
      const hashedPassword = await this.hashData(user.password)
      user.password = hashedPassword
      const emailAlreadyExists = await this.userService.findOneByEmail(user.email)
      const userNameAlreadyExists = await this.userService.findOneByUserName(user.username)
      if (userNameAlreadyExists || emailAlreadyExists) {
        throw 'User already exists'
      }
      const userEntityResponse = await this.userService.create(user)
      const tokens = await this.updateRefreshTokenHash(userEntityResponse)
      return {
        userEntityResponse,
        tokens,
      }
    } catch (error) {
      throw error
    }
  }

  ///Update the refresh token hash in the database for a user
  async updateRefreshTokenHash(user) {
    const tokens = await this.getTokens(user)
    // const hashedRefreshToken = await this.hashData(tokens.refreshToken);
    // await this.userService.updateUserRefreshTokenHash(user, hashedRefreshToken);
    return tokens
  }

  ///Create the JWT and refresh token for a user
  async getTokens(user) {
    const payload = {
      sub: user.id,
      username: user.username,
    }
    const [accessToken, refreshToken] = await Promise.all<any>([
      this.jwtService.signAsync(payload, {
        expiresIn: process.env.JWT_SECRET_EXPIRES,
        secret: process.env.JWT_SECRET,
      }),
      this.jwtService.signAsync(payload, {
        expiresIn: process.env.REFRESH_SECRET_EXPIRES,
        secret: process.env.REFRESH_TOKEN_SECRET,
      }),
    ])
    return {
      accessToken: accessToken,
      refreshToken: refreshToken,
    }
  }

  hashData(data: string) {
    return bcrypt.hash(data, 10)
  }
}
