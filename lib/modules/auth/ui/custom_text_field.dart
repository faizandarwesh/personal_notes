import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
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
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isObscure;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _isObscured,
      enableSuggestions: widget.isSuggestionEnabled,
      keyboardType: widget.inputType,
      style: Theme.of(context).textTheme.displaySmall!,
      validator: widget.validator,
      decoration: InputDecoration(
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        hintText: widget.hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        suffixIcon: widget.isObscure
            ? IconButton(
          icon: Icon(
            _isObscured ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () {
            setState(() {
              _isObscured = !_isObscured;
            });
          },
        )
            : null,
      ),
    );
  }
}
