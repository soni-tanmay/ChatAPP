import { ClassSerializerInterceptor, Module, ValidationPipe } from '@nestjs/common'
import { APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core'
import { AuthModule } from './auth/auth.module'
import { ChannelModule } from './channel/channel.module'
import { MessageModule } from './message/message.module'
import { PrismaModule } from './prisma/prisma.module'
import { UsersModule } from './users/users.module'

@Module({
  imports: [PrismaModule, AuthModule, UsersModule, ChannelModule, MessageModule],
  providers: [
    // Validate all incoming request inputs.
    // {
    //   provide: APP_PIPE,
    //   useValue: new ValidationPipe({
    //     whitelist: true,
    //     forbidUnknownValues: false,
    //     transform: true,
    //     transformOptions: {
    //       enableImplicitConversion: true,
    //     },
    //   }),
    // },
    // Serialize all outgoing responses, and avoid sending keys marked as excluded.
    // { provide: APP_INTERCEPTOR, useClass: ClassSerializerInterceptor },
  ],
})
export class AppModule {}
