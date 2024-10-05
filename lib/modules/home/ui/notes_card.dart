import 'package:flutter/material.dart';
import '../../notes/ui/edit_notes_screen.dart';

class NoteCard extends StatelessWidget {
  final String noteId;
  final String title;
  final String content;
  final Color backgroundColor;
  final VoidCallback onDelete;

  const NoteCard({
    Key? key,
    required this.noteId,
    required this.title,
    required this.content,
    required this.backgroundColor,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(noteId),
      direction: DismissDirection.horizontal,
      onDismissed: (direction) => onDelete(),
      background: Container(
        color: Colors.red,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNotesScreen(id: noteId, title: title, content: content),
            ),
          );
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
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ),
      ),
    );
  }
}