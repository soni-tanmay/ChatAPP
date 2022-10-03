import 'package:chat_app/services/chat/chat_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatEvent>((event, emit) async {
      if (event is FetchChat) {
        emit(ChatLoading());
        emit(await fetchChats(event.channelId));
      } else if (event is AddChat) {
        final List<ChatModel> chats = (state as ChatFetched).chats;
        chats.insert(0, event.chat);
        emit(ChatInitial());
        emit(ChatFetched(chats: chats));
      }
    });
  }

  Future<ChatState> fetchChats(String channelId) async {
    final List<ChatModel> chats = await ChatRepo.instance.fetchChat(channelId);
    return ChatFetched(chats: chats);
  }
}
