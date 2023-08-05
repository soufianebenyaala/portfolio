import 'package:flutter/material.dart';

class ThemeClass {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    // primaryColor: kPrimaryColor,
    //fontFamily: 'rpt_Regular',
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 24),
      bodyLarge: TextStyle(fontSize: 18),
      bodyMedium: TextStyle(fontSize: 16),
      bodySmall: TextStyle(color: Colors.grey, fontSize: 14),
    ),
  );
}
