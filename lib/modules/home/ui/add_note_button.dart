import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/helper_functions.dart';
import '../../notes/ui/edit_notes_screen.dart';


class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).cardColor,
      child: SvgPicture.asset("assets/icons/add.svg"),
      onPressed: () async{
        var result = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditNotesScreen()));
          HelperFunctions().showCustomSnackBar(context, '$result');

      },
    );
  }
}