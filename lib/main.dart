import 'package:flutter/material.dart';
import 'package:personal_notes/modules/home/ui/home_screen.dart';
import 'package:personal_notes/utils/theme/theme_config.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeConfig().darkTheme,
      home: const HomeScreen(),
    );
  }
}

