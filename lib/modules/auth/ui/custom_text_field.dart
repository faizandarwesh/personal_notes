import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType inputType;
  final bool isObscure;
  final bool isSuggestionEnabled;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.inputType,
    required this.isObscure,
    required this.isSuggestionEnabled,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscure,
      enableSuggestions: isSuggestionEnabled,
      keyboardType: inputType,
      style: Theme.of(context).textTheme.displaySmall!,
      validator: validator,
      decoration: InputDecoration(
        errorMaxLines: 2,
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
