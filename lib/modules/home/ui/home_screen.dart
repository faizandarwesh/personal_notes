import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_notes/modules/notes/ui/edit_notes_screen.dart';
import '../../../core/helper_widgets/custom_app_bar.dart';
import '../../../core/helper_widgets/custom_placeholder_screen.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).cardColor,
        child: SvgPicture.asset("assets/icons/add.svg"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditNotesScreen()));
        },
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CustomAppBar(),
          const SizedBox(
            height: 32,
          ),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: _notesCollection.snapshots(),
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
                        // Assuming each note document has a 'title' field
                        final noteData =
                            notes[index].data() as Map<String, dynamic>;

                        final notesId = notes[index].id;

                        final title = noteData['title'] ??
                            'No citle'; // Change 'title' to the correct field name
                        final content = noteData['content'] ?? 'No content';

                        return Dismissible(
                          key: ValueKey(notes[index].id),
                          // Unique key for each item
                          direction: DismissDirection.horizontal,
                          // Swipe left or right
                          onDismissed: (direction) {
                            // Remove the item from the Firestore collection
                            _notesCollection.doc(notes[index].id).delete();
                          },
                          background: Container(
                            color: Colors.red,
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EditNotesScreen(
                                            id: notesId,
                                            title: title,
                                            content: content,
                                          )));
                            },
                            child: Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 24, vertical: 10),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 48, vertical: 20),
                                child: Text(
                                  title,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                }),
          )
        ],
      )),
    );
  }
}
