import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference notesCollection =
  FirebaseFirestore.instance.collection('notes');

  Future<void> addNote(String title, String content) async {
    try {
      // Add a new note to the Firestore collection
      await notesCollection.add({
        'title': title,
        'content': content,
        'createdAt': FieldValue.serverTimestamp(), // Server timestamp for sorting
      });
      print("Note added successfully");
    } catch (e) {
      print("Failed to add note: $e");
    }
  }

  Future<void> updateNote(String id, String title, String content) async {
    try {
      // Update the existing note in Firestore by noteId
      await notesCollection.doc(id).update({
        'title': title,
        'content': content,
        'updatedAt': FieldValue.serverTimestamp(), // Timestamp to track last update
      });
      print("Note updated successfully");
    } catch (e) {
      print("Failed to update note: $e");
    }
  }

}
