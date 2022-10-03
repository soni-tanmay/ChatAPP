// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:chat_app/logic/authentication_bloc/authentication_bloc.dart';
import 'package:chat_app/logic/channel_bloc/channel_bloc.dart';
import 'package:chat_app/services/authentication/authentication_repo.dart';
import 'package:chat_app/services/socket/socket_service.dart';
import 'package:chat_app/utilities/export.dart';
import 'package:chat_app/view/channel_menu/channel_menu.dart';
import 'package:chat_app/view/chat_page/profile_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/chat_bloc/chat_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  late User user;

  @override
  void initState() {
    user = context.read<AuthenticationBloc>().authenticationModel.user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Channel Name'),
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ProfileSheet(
                  user: user,
                ),
              );
            },
            child: CircleAvatar(
              backgroundColor: AppTheme.lightTheme.colorScheme.primary,
              backgroundImage: NetworkImage(user.profilePic),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
      drawer: (MediaQuery.of(context).size.width < 1200)
          ? const Drawer(
              child: ChannelMenu(),
            )
          : null,
      body: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          if (state is ChatFetched) {
            return ListView.builder(
              itemCount: state.chats.length,
              reverse: true,
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                    backgroundImage: NetworkImage(
                      state.chats[index].user.profilePic,
                    ),
                    radius: 16,
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppTheme.lightTheme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.chats[index].user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.lightTheme.colorScheme.secondary,
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(state.chats[index].payload.message),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Fetching chats....'),
            );
          }
        },
      ),
      bottomNavigationBar: TextField(
        controller: _controller,
        maxLines: 3,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppTheme.lightTheme.colorScheme.primary,
          hintText: 'Enter your message here',
          suffixIcon: IconButton(
            icon: const Icon(
              Icons.send,
              color: AppTheme.grey,
            ),
            onPressed: () {
              SocketService.instance.socket.emit(
                'sendMessage',
                jsonEncode({
                  "message": _controller.text,
                  "senderId": user.id,
                  "channelId":
                      (context.read<ChannelBloc>().state as ChannelSuccessfull)
                          .selectedChannel
                }),
              );
              _controller.clear();
            },
          ),
          suffixIconColor: AppTheme.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
