import 'package:chat_app/services/app_service/app_service.dart';
import 'package:chat_app/services/channel/channel_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'channel_event.dart';
part 'channel_state.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  ChannelBloc() : super(ChannelInitial()) {
    on<ChannelEvent>((event, emit) async {
      if (event is CreateChannel) {
        emit(ChannelLoading());
        // emit(await createChannel(event));
      } else if (event is FindAllChannel) {
        emit(ChannelLoading());
        emit(await findAllChannel());
      } else if (event is FindTrendingChannel) {
        emit(ChannelLoading());
        // emit(await findTrendingChannel());
      } else if (event is SearchChannel) {
        emit(ChannelLoading());
        // emit(await searchChannel());
      } else if (event is ChangeSelectedChannel) {
        emit((state as ChannelSuccessfull).copyWith(
          selectedChannel: event.channelId,
        ));
      }
    });
  }

  Future<ChannelState> findAllChannel() async {
    try {
      List<ChannelModal> response =
          await AppService.getInstance.channelRepository.findAllChannel();

      return ChannelSuccessfull(
        channelList: response,
        selectedChannel: response
            .where((element) => element.name.toLowerCase() == 'general')
            .first
            .id,
      );
    } catch (e) {
      return ChannelError();
    }
  }

  Future<ChannelState> findTrendingChannel() async {
    try {
      var response =
          await AppService.getInstance.channelRepository.findTrendingChannel();
      return ChannelSuccessfull(
        channelList: response,
        selectedChannel: response
            .where((element) => element.name.toLowerCase() == 'general')
            .first
            .id,
      );
    } catch (e) {
      return ChannelError();
    }
  }
}
