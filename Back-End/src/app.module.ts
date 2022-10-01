import { ClassSerializerInterceptor, Module, ValidationPipe } from '@nestjs/common'
import { ChannelModule } from './channel/channel.module'
import { PrismaModule } from './prisma/prisma.module'
import { MessageModule } from './message/message.module'
import { APP_INTERCEPTOR, APP_PIPE } from '@nestjs/core'

@Module({
  imports: [PrismaModule, ChannelModule, MessageModule],
  providers: [
    // Validate all incoming request inputs.
    {
      provide: APP_PIPE,
      useValue: new ValidationPipe({
        whitelist: true,
        forbidUnknownValues: true,
        transform: true,
        transformOptions: {
          enableImplicitConversion: true,
        },
      }),
    },
    // Serialize all outgoing responses, and avoid sending keys marked as excluded.
    { provide: APP_INTERCEPTOR, useClass: ClassSerializerInterceptor },
  ],
})
export class AppModule {}
