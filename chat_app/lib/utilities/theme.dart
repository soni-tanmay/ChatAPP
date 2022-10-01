import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFF4F2F8),
    colorScheme: const ColorScheme.light(
        primary: Color(0xFFFFFFFF),
        secondary: Color(0xFF7B68EE),
        onPrimary: Colors.black),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.black,
      selectionColor: Color.fromARGB(255, 236, 234, 250),
    ),
  );

  static const Color extraLightPurple = Color.fromARGB(255, 236, 234, 250);
  static const Color grey = Colors.grey;
  static Color lightGrey = Colors.grey.shade100;
  static const Color black = Colors.black;
  static const Color red = Colors.red;
}
