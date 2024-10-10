import 'package:flutter/material.dart';
import 'package:personal_notes/utils/helper_functions.dart';
import '../../notes/ui/edit_notes_screen.dart';

class NoteCard extends StatelessWidget {
  final String noteId;
  final String title;
  final String content;
  final Color backgroundColor;
  final VoidCallback onDelete;

  const NoteCard({
    super.key,
    required this.noteId,
    required this.title,
    required this.content,
    required this.backgroundColor,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(noteId),
      direction: DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        bool shouldDelete = await HelperFunctions().showCustomCupertinoDialog(
          context,
          "Delete",
          "Are you sure you want to delete this note?",
        );

        if (shouldDelete) {
          onDelete();
        };
        return shouldDelete; // Return true to delete, false to cancel
      },
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: () async{
          var result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  EditNotesScreen(id: noteId, title: title, content: content)));
         if(result != null){
           HelperFunctions().showCustomSnackBar(context, '$result');
         }
        },
        child: Card(
          color: backgroundColor,
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
