part of 'channel_bloc.dart';

@immutable
abstract class ChannelState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChannelInitial extends ChannelState {}

class ChannelLoading extends ChannelState {}

class ChannelSuccessfull extends ChannelState {
  final List<ChannelModal> channelList;
  ChannelSuccessfull({
    required this.channelList,
  });
}

class ChannelError extends ChannelState {}
