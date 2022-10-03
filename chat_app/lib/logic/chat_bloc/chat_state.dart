// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

@immutable
abstract class ChatState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatFetched extends ChatState {
  final List<ChatModel> chats;
  ChatFetched({
    required this.chats,
  });

  @override
  List<Object?> get props => [chats];
  

  ChatFetched copyWith({
    List<ChatModel>? chats,
  }) {
    return ChatFetched(
      chats: chats ?? this.chats,
    );
  }
}
