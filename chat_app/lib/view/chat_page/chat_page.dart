// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/logic/authentication_bloc/authentication_bloc.dart';
import 'package:chat_app/services/authentication/authentication_repo.dart';
import 'package:chat_app/utilities/export.dart';
import 'package:chat_app/view/channel_menu/channel_menu.dart';
import 'package:chat_app/view/chat_page/profile_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  ChatPage({super.key});

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
      body: ListView.builder(
        itemCount: 20,
        reverse: true,
        padding: const EdgeInsets.all(8),
        itemBuilder: (context, index) => Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppTheme.lightTheme.colorScheme.secondary,
              ),
              child: Center(
                child: Text(
                  'U',
                  style: TextStyle(
                    color: AppTheme.lightTheme.colorScheme.primary,
                  ),
                ),
              ),
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
                      'user',
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
                      child: Text(index.toString()),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
            onPressed: () {},
          ),
          suffixIconColor: AppTheme.grey,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
