import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final String icon1;
  final String icon2;
  final VoidCallback? onSearchPressed;  // Callback for the search button
  final VoidCallback? onInfoPressed;    // Callback for the info button

  const CustomAppBar({
    super.key,
    this.icon1 = "assets/icons/search.svg",
    this.icon2 = "assets/icons/info_outline.svg",
    this.onSearchPressed,   // Accepting callback from outside
    this.onInfoPressed,     // Accepting callback from outside
  });
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),  // Add top padding based on the status bar height
      child: Row(
        children: [
          Text(
            "Notes",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const Spacer(),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: IconButton(
                  onPressed: onSearchPressed,
                  icon: SvgPicture.asset(icon1)),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child:
                  IconButton(onPressed: onInfoPressed, icon: SvgPicture.asset(icon2)),
            ),
          ),
        ],
      ),
    );
  }
}
