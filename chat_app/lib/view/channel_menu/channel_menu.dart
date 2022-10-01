import 'package:chat_app/utilities/export.dart';
import 'package:chat_app/view/channel_menu/widgets/my_channels.dart';
import 'package:chat_app/view/channel_menu/widgets/search_bar.dart';
import 'package:chat_app/view/channel_menu/widgets/trending_channels.dart';
import 'package:flutter/material.dart';

class ChannelMenu extends StatelessWidget {
  const ChannelMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.lightTheme.colorScheme.primary,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/workspace.png'),
        ),
        title: const Text(
          'WorkSpace',
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBar(),
            const SizedBox(
              height: 24,
            ),
            const TrendingChannel(),
            const SizedBox(
              height: 24,
            ),
            const MyChannels(),
          ],
        ),
      ),
    );
  }
}
