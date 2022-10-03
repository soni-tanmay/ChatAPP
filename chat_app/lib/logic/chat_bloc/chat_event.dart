// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class FetchChat extends ChatEvent {
  final String channelId;
  FetchChat({
    required this.channelId,
  });
}


class AddChat extends ChatEvent {
final ChatModel chat;
  AddChat({
    required this.chat,
  });
}
