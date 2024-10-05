import 'package:flutter/material.dart';
import 'package:personal_notes/core/helper_widgets/custom_app_bar.dart';
import '../../../service/firebase_service.dart';
import '../../../utils/colors/color_constants.dart';

class EditNotesScreen extends StatefulWidget {
  final String id;
  final String title;
  final String content;

  const EditNotesScreen({
    super.key,
    this.id = "",
    this.title = "",
    this.content = "",
  });

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  final FirestoreService _firestoreService = FirestoreService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _addNote() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (title.isNotEmpty && content.isNotEmpty) {
      if (widget.title.isEmpty && widget.content.isEmpty) {
        //This is the case when we are adding a new note
        //Because both title and content value from constructor are empty

        // Call the Firestore service to add a new note
        _firestoreService.addNote(title, content).then((_) {
          _titleController.clear();
          _contentController.clear();
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Note added successfully')),
            );
          }

          Navigator.pop(context);
        });
      } else {
        // Call the Firestore service to edit an existing note
        _firestoreService.updateNote(widget.id, title, content).then((_) {
          _titleController.clear();
          _contentController.clear();
          if(context.mounted){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Note added successfully')),
            );
            Navigator.pop(context);
          }


        });
      }
    } else {
      if(context.mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a title and content')),
        );
      }
    }
  }

  @override
  void initState() {
    _titleController.text = widget.title;
    _contentController.text = widget.content;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
              onSearchPressed: () {
                Navigator.pop(context);
              },
              onInfoPressed: () {
                _addNote();
              },
              icon1: "assets/icons/visibility.svg",
              icon2: "assets/icons/save.svg"),
          const SizedBox(
            height: 16,
          ),
          TextFormField(
            controller: _titleController,
            style: Theme.of(context).textTheme.headlineLarge!,
            maxLines: 3,
            minLines: 1,
            maxLength: 50,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Title',
              hintStyle: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorConstants.hintColor),
              border: InputBorder.none,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          TextFormField(
            controller: _contentController,
            style: Theme.of(context).textTheme.displaySmall!,
            maxLines: 10,
            minLines: 1,
            maxLength: 500,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(
              counterText: '',
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              hintText: 'Type something',
              hintStyle: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: ColorConstants.hintColor),
              border: InputBorder.none,
            ),
          )
        ],
      )),
    );
  }
}
