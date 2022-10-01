import 'package:flutter/material.dart';

import '../../services/authentication/authentication_repo.dart';
import '../../utilities/theme.dart';

class ProfileSheet extends StatelessWidget {
  const ProfileSheet({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 300,
        color: Colors.red,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CircleAvatar(
              radius: 30,
              backgroundColor: AppTheme.lightTheme.colorScheme.primary,
              backgroundImage: NetworkImage(
                user.profilePic,
              ),
            ),
            Text('Name'),
          ],
        ),
      ),
    );
  }
}