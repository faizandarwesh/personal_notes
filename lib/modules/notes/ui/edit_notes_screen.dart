import 'package:flutter/material.dart';
import 'package:personal_notes/core/helper_widgets/custom_app_bar.dart';

import '../../../utils/colors/color_constants.dart';

class EditNotesScreen extends StatelessWidget {
  const EditNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(
              icon1: "assets/icons/visibility.svg",
              icon2: "assets/icons/save.svg"),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.headlineLarge!,
            maxLines: 3,
            minLines: 1,
            maxLength: 50,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Title',
              hintStyle: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorConstants.hintColor),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            style: Theme.of(context).textTheme.displaySmall!,
            maxLines: 10,
            minLines: 1,
            maxLength: 500,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Type something',
              hintStyle: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: ColorConstants.hintColor),
              border: InputBorder.none,
            ),
          )
        ],
      )),
    );
  }
}
