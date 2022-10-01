import { Body, Controller, Get, Post, Request, UseGuards } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { ChannelService } from './channel.service';
import { CreateChannelDto } from './dto/create-channel.dto';

@Controller('channels')
export class ChannelController {
  constructor(private readonly channelService: ChannelService) {}

  @UseGuards(AuthGuard('jwt-strategy'))
  @Post()
  create(@Body() createChannelDto: CreateChannelDto, @Request() req) {
    console.log(req);
    return this.channelService.create(createChannelDto, req.user.id)
  }

  // @UseGuards(AuthGuard('jwt-strategy'))
  @Get()
  findAll(@Request() req) {
    console.log(req.user.id);
    return this.channelService.findAll(req.user.id)
  }

  // @UseGuards(AuthGuard('jwt-strategy'))
  @Get('trending')
  findTrending() {
    return this.channelService.findTrending()
  }

  // @UseGuards(AuthGuard('jwt-strategy'))
  @Get('search')
  search() {
    return this.channelService.findTrending()
  }
}
