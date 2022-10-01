// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/logic/authentication_bloc/authentication_bloc.dart';
import 'package:chat_app/services/authentication/authentication_repo.dart';
import 'package:chat_app/utilities/export.dart';
import 'package:chat_app/view/chat_page/profile_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController _controller = TextEditingController();

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
      floatingActionButton: Container(
        margin: const EdgeInsets.all(24),
        padding: const EdgeInsets.all(8),
        height: MediaQuery.of(context).size.height * 0.1,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppTheme.lightTheme.colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _controller,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


