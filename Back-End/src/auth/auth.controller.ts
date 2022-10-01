import { Body, Controller, Get, Post, Request, Response, UseGuards } from '@nestjs/common'
import { AuthGuard } from '@nestjs/passport'
import { ApiBearerAuth, ApiOperation, ApiResponse, ApiTags } from '@nestjs/swagger'
import { AuthService } from './auth.service'
import { LoginDto, RegisterDto, UserDto } from './dto'
import { LocalAuthGuard } from './passport'

@ApiTags('Auth')
@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @ApiOperation({ summary: 'To login an existing user.' })
  @ApiResponse({
    status: 200,
    description: 'logged in successfully',
    // type: LoginDto,
  })
  @ApiResponse({
    status: 400,
    description: 'It comes when there is something wrong with the data sent.',
  })
  @Post('login')
  async login(@Request() req, @Body() body: LoginDto, @Response() res): Promise<any> {
    try {
      const { existingUser, tokens } = await this.authService.login(body)
      const { password, ...user } = existingUser
      return res.status(200).json({
        status: 'success',
        msg: 'Login successful',
        user: user,
        ...tokens,
      })
    } catch (error) {
      return res.status(400).json({
        status: 'failed',
        msg: error,
      })
    }
  }

  @ApiOperation({ summary: 'To register a new user.' })
  @ApiResponse({ status: 201, description: 'User created successfully' })
  @ApiResponse({
    status: 400,
    description: 'It comes when there is something wrong with the data sent.',
  })
  @Post('register')
  async register(@Body() body: RegisterDto, @Response() res): Promise<any> {
    try {
      const { userEntityResponse, tokens } = await this.authService.register(body)
      const { password, ...user } = userEntityResponse
      return res.status(201).json({
        status: 'success',
        msg: 'Registration successful',
        user: user,
        ...tokens,
      })
    } catch (error) {
      return res.status(400).json({
        status: 'failed',
        msg: error,
      })
    }
  }

  // @ApiOperation({ summary: 'To refresh the user JWT token' })
  // @ApiResponse({
  //   status: 200,
  //   description: 'User token refreshed successfully',
  // })
  // @UseGuards(AuthGuard('refresh-token-strategy'))
  // @Get('refreshToken')
  // @ApiBearerAuth('defaultBearerAuth')
  // async refreshToken(@Request() req, @Response() res): Promise<any> {
  //   const token = await this.authService.refreshToken(
  //     req.user.id,
  //     req.headers.authorization.replace('Bearer ', '').trim(),
  //   )
  //   return res.status(200).json({
  //     msg: 'Refresh Token successful',
  //     user: req.user,
  //     ...token,
  //   })
  // }
}
