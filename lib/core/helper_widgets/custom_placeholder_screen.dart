import 'package:flutter/material.dart';

class CustomPlaceholderScreen extends StatelessWidget {
  final String placeholderImage;
  final String title;

  const CustomPlaceholderScreen(
      {super.key,
      this.placeholderImage = "assets/images/home_screen_cover.png",
      this.title = "Create your first note !"});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(placeholderImage),
          const SizedBox(
            height: 16,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
