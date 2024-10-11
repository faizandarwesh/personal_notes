import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:personal_notes/core/helper_widgets/custom_app_bar.dart';
import '../controller/edit_notes_controller.dart';
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
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final NoteController _noteController = NoteController(); // Instantiate the controller
  // QuillController _controller = QuillController.basic();


  @override
  void initState() {
    _titleController.text = widget.title;
    _contentController.text = widget.content;

    super.initState();
  }

  void _handleSave() {
    final title = _titleController.text;
    final content = _contentController.text;

    if (widget.id.isEmpty) {
      // Adding a new note
      _noteController.addNote(
        title: title,
        content: content,
        context: context,
      );
    } else {
      // Updating an existing note
      _noteController.updateNote(
        id: widget.id,
        title: title,
        content: content,
        context: context,
      );
    }
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
              onInfoPressed: _handleSave, // Use the new handler
              icon1: "assets/icons/visibility.svg",
              icon2: "assets/icons/save.svg",
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _titleController,
              style: Theme.of(context).textTheme.displayLarge!,
              maxLines: 3,
              minLines: 1,
              maxLength: 50,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.words,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: 'Title',
                hintStyle: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: ColorConstants.hintColor),
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 32),
            TextFormField(
              controller: _contentController,
              style: Theme.of(context).textTheme.displaySmall!,
              maxLines: 10,
              minLines: 1,
              maxLength: 500,
              keyboardType: TextInputType.multiline,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                counterText: '',
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                hintText: 'Type something',
                hintStyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: ColorConstants.hintColor),
                border: InputBorder.none,
              ),
            ),
         /*   QuillSimpleToolbar(

              controller: _controller,
              configurations: const QuillSimpleToolbarConfigurations(showSearchButton: false,showClipboardCopy: false, showClipboardPaste: false, showLineHeightButton: false, showLink: false, showClipboardCut: false, showCodeBlock: false,showDirection: false, showDividers: false, showClearFormat: false, showFontFamily: false, showIndent: false, showSmallButton: false, showSuperscript: false, showStrikeThrough: false, showQuote: false, showRightAlignment: false, showColorButton: false, showBackgroundColorButton: false, showSubscript: false),
            ),
            Expanded(
              child: QuillEditor.basic(
                controller: _controller,
                configurations: const QuillEditorConfigurations(),
              ),
            )
*/
          ],
        ),
      ),
    );
  }
}
