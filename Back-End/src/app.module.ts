import { Module } from '@nestjs/common'
import { ChannelModule } from './channel/channel.module'
import { PrismaModule } from './prisma/prisma.module'

@Module({
  imports: [PrismaModule, ChannelModule],
})
export class AppModule {}
