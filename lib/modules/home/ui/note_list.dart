import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:personal_notes/utils/helper_functions.dart';
import '../../../core/helper_widgets/custom_placeholder_screen.dart';
import 'notes_card.dart';

/// Widget to display the list of notes with Firestore stream handling
class NotesList extends StatelessWidget {

  final CollectionReference notesCollection;
  final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

  NotesList({super.key, required this.notesCollection});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: notesCollection.where('user_id', isEqualTo: currentUserId)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Error fetching notes"));
        }

        final notes = snapshot.data?.docs;

        if (notes == null || notes.isEmpty) {
          return const CustomPlaceholderScreen();
        }

        return ListView.builder(
          shrinkWrap: true,
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final noteData = notes[index].data() as Map<String, dynamic>;
            final notesId = notes[index].id;
            final title = noteData['title'] ?? 'No title';
            final content = noteData['content'] ?? 'No content';

            // Assign selected color to the notes card
            final selectedColor = noteData['color'];
            Color? randomColor;

            if (selectedColor == null) {
              // Generate a random color in case of no color selected by the user
              randomColor = HelperFunctions().generateMaterialColor();
            }

            return NoteCard(
              noteId: notesId,
              title: title,
              content: content,
              backgroundColor: selectedColor == null
                  ? randomColor
                  : Color(int.parse(selectedColor)),
              onDelete: () => notesCollection.doc(notesId).delete(),
            );
          },
        );
      },
    );
  }
}
