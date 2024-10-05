import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../notes/ui/edit_notes_screen.dart';


class AddNoteButton extends StatelessWidget {
  const AddNoteButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Theme.of(context).cardColor,
      child: SvgPicture.asset("assets/icons/add.svg"),
      onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditNotesScreen()));
      },
    );
  }
}