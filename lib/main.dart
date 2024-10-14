import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:personal_notes/modules/auth/ui/register_screen.dart';
import 'package:personal_notes/modules/home/ui/home_screen.dart';
import 'package:personal_notes/utils/theme/theme_config.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Notes',
      theme: ThemeConfig().darkTheme,
      home: FirebaseAuth.instance.currentUser != null
          ? const HomeScreen()
          : RegisterScreen(),
    );
  }
}
