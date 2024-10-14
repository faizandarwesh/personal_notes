import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:personal_notes/modules/auth/controller/auth_controller.dart';
import 'package:personal_notes/modules/auth/ui/custom_button.dart';
import 'package:personal_notes/modules/auth/ui/custom_text_field.dart';
import '../../../utils/helper_functions.dart';


class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                    height: 50,
                  ),
                  CustomTextField(
                    controller: _emailController,
                    hintText: 'Email Address',
                    inputType: TextInputType.emailAddress,
                    isObscure: false,
                    isSuggestionEnabled: true,
                    validator: (value) =>
                        HelperFunctions().validateEmail(value),
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      inputType: TextInputType.text,
                      isObscure: true,
                      isSuggestionEnabled: false,
                      validator: (value) =>
                          HelperFunctions().validatePassword(value)),
                  const SizedBox(height: 32),
                  CustomButton(
                      label: 'Login',
                      onPressed: () async {
                        // Check if formKey exists, then validate the form before calling onPressed
                        if (_formKey.currentState!.validate()) {
                          final String email = _emailController.text.trim();
                          final String password =
                              _passwordController.text.trim();
                          try {
                           AuthController().login(email,password,context);

                          } on FirebaseAuthException catch (e) {
                            print(e.message); // Return the error message
                          }
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
