part of 'channel_bloc.dart';

@immutable
abstract class ChannelEvent {}

class CreateChannel extends ChannelEvent {
  final String name;
  final String image;
  final String workspaceId;
  CreateChannel({
    required this.name,
    required this.image,
    required this.workspaceId,
  });
}

class FindAllChannel extends ChannelEvent {
  FindAllChannel();
}

class FindTrendingChannel extends ChannelEvent {
  FindTrendingChannel();
}

class SearchChannel extends ChannelEvent {
  final String name;
  SearchChannel({
    required this.name,
  });
}
