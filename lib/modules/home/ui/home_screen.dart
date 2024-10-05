import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_notes/modules/search/ui/search_screen.dart';
import '../../../core/helper_widgets/custom_app_bar.dart';
import 'add_note_button.dart';
import 'note_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference _notesCollection =
  FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const AddNoteButton(),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              onSearchPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()));
              },
            ),
            const SizedBox(height: 32),
            Expanded(
              child: NotesList(notesCollection: _notesCollection),
            ),
          ],
        ),
      ),
    );
  }
}
