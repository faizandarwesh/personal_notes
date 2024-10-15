import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:personal_notes/utils/helper_functions.dart';

class FirestoreService {
  final CollectionReference notesCollection =
      FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String userId, String title, String content,Color color) async {
    try {

      String hexColor = HelperFunctions().colorToHex64(color);

      // Add a new note to the Firestore collection
      await notesCollection.add({
        'user_id': userId,
        'title': title,
        'content': content,
        'color' : hexColor,
        'createdAt': FieldValue.serverTimestamp(),
        // Server timestamp for sorting
      });
    } catch (e) {
      print("Failed to add note: $e");
    }
  }

  Future<void> updateNote(String id, String title, String content,Color color) async {
    try {

      String hexColor = HelperFunctions().colorToHex64(color);
      // Update the existing note in Firestore by noteId

      await notesCollection.doc(id).update({
        'title': title,
        'content': content,
        'color' : hexColor,
        'updatedAt': FieldValue.serverTimestamp(),
        // Timestamp to track last update
      });
    } catch (e) {
      print("Failed to update note: $e");
    }
  }

  // Search notes by title (case-insensitive)
  Future<List<QueryDocumentSnapshot>> searchNotesByTitle(String query) async {
    try {
      // Search for notes where the title contains the query (case-insensitive)
      final searchResults = await notesCollection
          .where('title', isGreaterThanOrEqualTo: query)
          .where('title', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
      return searchResults.docs;
    } catch (e) {
      return [];
    }
  }
}
