import 'package:chat_app/logic/channel_bloc/channel_bloc.dart';
import 'package:chat_app/utilities/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingChannel extends StatefulWidget {
  const TrendingChannel({super.key});

  @override
  State<TrendingChannel> createState() => _TrendingChannelState();
}

class _TrendingChannelState extends State<TrendingChannel> {
  @override
  void initState() {
    context.read<ChannelBloc>().add(FindTrendingChannel());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChannelBloc, ChannelState>(
      builder: (context, state) {
        if (state is ChannelSuccessfull) {
          return ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: state.channelList.length + 1,
              itemBuilder: ((context, index) {
                if (index == 0) {
                  return const ListTile(
                    title: Text(
                      'Trending Channels:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    dense: true,
                    visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                  );
                }
                return ListTile(
                  title: Text(
                    state.channelList[index - 1].name ?? '',
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
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                );
              }));
        } else {
          return const Center(
            child: Text('loading...'),
          );
        }
      },
    );
  }
}
