import 'package:chat_app/logic/authentication_bloc/authentication_bloc.dart';
import 'package:chat_app/logic/avatar_bloc/avatar_bloc.dart';
import 'package:chat_app/utilities/export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
        BlocProvider(
          create: (context) => AvatarBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Chat App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: Navigation.initalPage,
        onGenerateRoute: Navigation.generateRoute,
      ),
    );
  }
}
