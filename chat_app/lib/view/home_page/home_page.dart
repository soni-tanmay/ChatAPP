import 'package:flutter/material.dart';

import '../channel_menu/channel_menu.dart';
import '../chat_page/chat_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 2, child: ChannelMenu()),
        Expanded(flex: 8, child: ChatPage())
      ],
    );
  }
}
