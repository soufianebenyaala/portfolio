import 'package:flutter/material.dart';
import 'package:portfolio/screens/portfolio_screen.dart';
import 'package:portfolio/util/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeClass.lightTheme,
      home: const PortfolioScreen(),
    );
  }
}
