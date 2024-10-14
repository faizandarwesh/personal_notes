import 'package:flutter/material.dart';
import 'package:personal_notes/service/firebase_service.dart';
import 'package:personal_notes/utils/helper_functions.dart';

class NoteController {
  final FirestoreService _firestoreService = FirestoreService();

  Future<void> addNote({
    required String id,
    required String title,
    required String content,
    Color? color,
    required BuildContext context,
  }) async {
    if (title.isNotEmpty && content.isNotEmpty) {
      // Show loading dialog
      HelperFunctions().showLoadingDialog(context);

      try {
        // Add or update the note based on the content
        await _firestoreService.addNote(id, title, content,color!);
        HelperFunctions()
            .showCustomSnackBar(context, 'Note added successfully');
      } catch (error) {
        HelperFunctions()
            .showCustomSnackBar(context, 'Failed to add note: $error');
      } finally {
        Navigator.pop(context); // Close loading dialog
        Navigator.pop(context); // Return to the previous screen
      }
    } else {
      HelperFunctions()
          .showCustomSnackBar(context, 'Please enter a title and content');
    }
  }

  Future<void> updateNote({
    required String id,
    required String title,
    required String content,
    required BuildContext context,
  }) async {
    if (title.isNotEmpty && content.isNotEmpty) {
      // Show loading dialog
      HelperFunctions().showLoadingDialog(context);

      try {
        // Update the note
        await _firestoreService.updateNote(id, title, content);
        HelperFunctions()
            .showCustomSnackBar(context, 'Note updated successfully');
      } catch (error) {
        HelperFunctions()
            .showCustomSnackBar(context, 'Failed to update note: $error');
      } finally {
        Navigator.pop(context); // Close loading dialog
        Navigator.pop(context); // Return to the previous screen
      }
    } else {
      HelperFunctions()
          .showCustomSnackBar(context, 'Please enter a title and content');
    }
  }
}
