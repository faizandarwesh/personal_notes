import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:personal_notes/utils/colors/color_constants.dart';
import '../../../core/helper_widgets/custom_placeholder_screen.dart';
import '../../../service/firebase_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchFieldController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();
  List<QueryDocumentSnapshot> _searchResults = [];
  bool _isLoading = false;

  void _searchNotes() async {
    final query = _searchFieldController.text.trim();

    if (query.isNotEmpty) {
      setState(() {
        _isLoading = true;
      });

      final results = await _firestoreService.searchNotesByTitle(query);

      setState(() {
        _searchResults = results;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: TextFormField(
                controller: _searchFieldController,
                style: Theme.of(context).textTheme.displaySmall,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 32),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  hintText: "Search by keyword...",
                  hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                      fontWeight: FontWeight.w300,
                      color: ColorConstants.hintColor),
                ),
                onFieldSubmitted: (value) => _searchNotes(), // Trigger search
              ),
            ),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _searchResults.isEmpty
                ? const CustomPlaceholderScreen(
              placeholderImage: "assets/images/search_placeholder.png",
              title: "No matching notes found.",
            )
                : Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  final noteData =
                  _searchResults[index].data() as Map<String, dynamic>;
                  return _buildNoteCard(noteData);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNoteCard(Map<String, dynamic> noteData) {
    return GestureDetector(
      onTap: (){
     /*   Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotesScreen(id: noteData['id'], title: noteData['title'], content: noteData['content']),
          ),
        );*/
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                noteData['title'] ?? 'No Title',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                noteData['content'] ?? 'No Content',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
