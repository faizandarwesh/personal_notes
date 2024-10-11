import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_notes/modules/auth/ui/custom_button.dart';
import 'package:personal_notes/modules/auth/ui/login_screen.dart';
import 'custom_text_field.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Lottie.asset('assets/raw/notes_animation.json'),
              Text(
                "Notes",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                'Organize your tasks, streamline your day.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const SizedBox(
                height: 32,
              ),
              CustomTextField(
                  controller: _nameController,
                  hintText: 'Full Name',
                  inputType: TextInputType.text,
                  isObscure: false,
                  isSuggestionEnabled: true),
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _emailController,
                  hintText: 'Email Address',
                  inputType: TextInputType.emailAddress,
                  isObscure: false,
                  isSuggestionEnabled: true),
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _passwordController,
                  hintText: 'Email Address',
                  inputType: TextInputType.text,
                  isObscure: true,
                  isSuggestionEnabled: false),
              const SizedBox(height: 32),
              CustomButton(label: 'Register', onPressed: () {}),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Text(
                  'Already have an account?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
