// ignore_for_file: public_member_api_docs, sort_constructors_first
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
  final String selectedChannel;
  ChannelSuccessfull({
    required this.channelList,
    required this.selectedChannel,
  });

  @override
  List<Object?> get props => [channelList, selectedChannel];

  ChannelSuccessfull copyWith({
    List<ChannelModal>? channelList,
    String? selectedChannel,
  }) {
    return ChannelSuccessfull(
      channelList: channelList ?? this.channelList,
      selectedChannel: selectedChannel ?? this.selectedChannel,
    );
  }
}

class ChannelError extends ChannelState {}
