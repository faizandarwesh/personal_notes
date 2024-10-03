import 'package:flutter/material.dart';
import 'package:personal_notes/modules/home/ui/home_screen.dart';
import 'package:personal_notes/utils/theme/theme_config.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);  // Initialize Firebase
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

