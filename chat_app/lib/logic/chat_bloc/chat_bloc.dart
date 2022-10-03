import 'package:chat_app/services/authentication/authentication_repo.dart';
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
        chats.add(event.chat);
        emit(ChatInitial());
        emit(ChatFetched(chats: chats.reversed.toList()));
      }
    });
  }

  Future<ChatState> fetchChats(String channelId) async {
    return ChatFetched(chats: []);
  }
}
