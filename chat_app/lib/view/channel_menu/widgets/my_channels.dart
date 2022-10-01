import 'package:chat_app/utilities/export.dart';
import 'package:flutter/material.dart';

class MyChannels extends StatelessWidget {
  const MyChannels({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: 10 + 1,
          itemBuilder: ((context, index) {
            if (index == 0) {
              return const ListTile(
                title: Text(
                  'My Channels:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                dense: true,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              );
            }
            return ListTile(
              title: const Text(
                'channel',
                style: TextStyle(color: AppTheme.grey),
              ),
              leading: const Text(
                '#',
                style: TextStyle(color: AppTheme.grey),
              ),
              dense: true,
              minLeadingWidth: 0,
              onTap: () {},
              hoverColor: AppTheme.extraLightPurple,
              visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
            );
          })),
    );
  }
}
