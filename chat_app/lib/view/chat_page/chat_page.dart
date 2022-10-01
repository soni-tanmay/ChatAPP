import 'package:chat_app/utilities/export.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  ChatPage({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Channel Name'),
      ),
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
