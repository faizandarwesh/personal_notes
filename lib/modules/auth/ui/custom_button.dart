import 'package:flutter/material.dart';
import '../../../utils/colors/color_constants.dart';

class CustomButton extends StatelessWidget {

  final String label;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.label,
    required this.onPressed
  });


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () => onPressed(),
          style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          // Button height
          backgroundColor: ColorConstants.cardColor,
          // Background color
          foregroundColor: Colors.white,
          // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5, // Button shadow
        ),
        child: Text(
          label,
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
    );
  }
}
