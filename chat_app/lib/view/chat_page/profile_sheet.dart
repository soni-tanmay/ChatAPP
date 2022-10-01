// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:chat_app/utilities/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/avatar_bloc/avatar_bloc.dart';
import '../../services/authentication/authentication_repo.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      titlePadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      title: const Text(
        'My Profile',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Center(
            child: CircleAvatar(
              backgroundColor: AppTheme.lightTheme.colorScheme.primary,
              backgroundImage: NetworkImage(user.profilePic),
              radius: 50,
            ),
          ),
          const SizedBox(height: 14),
          CustomButton(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const AvatarList(),
              );
            },
            buttonText: 'Change avatar',
            width: MediaQuery.of(context).size.width * 0.08,
            height: 30,
          ),
          const SizedBox(height: 14),
          ProfileListTile(
            label: 'Name',
            content: user.name,
          ),
          const SizedBox(height: 14),
          ProfileListTile(
            label: 'Username',
            content: user.userName,
          ),
          const SizedBox(height: 14),
          ProfileListTile(
            label: 'Email',
            content: user.email,
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    Key? key,
    required this.label,
    required this.content,
  }) : super(key: key);

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: MediaQuery.of(context).size.width * 0.35,
      decoration: BoxDecoration(
        color: AppTheme.extraLightPurple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.grey,
              fontSize: 12,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarList extends StatefulWidget {
  const AvatarList({Key? key}) : super(key: key);

  @override
  State<AvatarList> createState() => _AvatarListState();
}

class _AvatarListState extends State<AvatarList> {
  @override
  void initState() {
    context.read<AvatarBloc>().add(FetchAvatar());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: BlocBuilder<AvatarBloc, AvatarState>(
        builder: (context, state) {
          if (state is AvatarSuccess) {
            return Wrap(
              spacing: 20,
              runSpacing: 20,
              alignment: WrapAlignment.center,
              children: List.generate(
                state.avatars.length,
                (index) => InkWell(
                  onTap: (){},
                  child: CircleAvatar(
                    backgroundColor: AppTheme.lightTheme.colorScheme.primary,
                    backgroundImage: NetworkImage(state.avatars[index]),
                    radius: 40,
                  ),
                ),
              ),
            );
          } else if (state is AvatarLoading || state is AvatarInitial) {
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppTheme.extraLightPurple),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
