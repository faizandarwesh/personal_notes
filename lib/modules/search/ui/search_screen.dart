import 'package:flutter/material.dart';
import 'package:personal_notes/utils/colors/color_constants.dart';

import '../../../core/helper_widgets/custom_placeholder_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchFieldController = TextEditingController();

    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: TextFormField(
              style: Theme.of(context).textTheme.displaySmall,
              controller: searchFieldController,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 32,),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  hintText: "Search by the keyword...",
                  hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: ColorConstants.hintColor)),
            ),
          ),
          const CustomPlaceholderScreen(
            placeholderImage: "assets/images/search_placeholder.png",
            title: "File not found. Try searching again.",
          )
        ],
      )),
    );
  }
}
