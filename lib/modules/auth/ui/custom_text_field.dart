import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool isObscure;
  final bool isSuggestionEnabled;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    required this.isObscure,
    required this.isSuggestionEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      enableSuggestions: isSuggestionEnabled,
      keyboardType: inputType,
      style: Theme.of(context).textTheme.displaySmall!,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.grey[600],
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
