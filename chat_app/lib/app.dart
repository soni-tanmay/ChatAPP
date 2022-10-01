import 'package:chat_app/utilities/export.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: AppTheme.lightTheme,
      initialRoute: Navigation.initalPage,
      onGenerateRoute: Navigation.generateRoute,
    );
  }
}
