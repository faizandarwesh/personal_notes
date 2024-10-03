import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:personal_notes/modules/notes/ui/edit_notes_screen.dart';
import '../../../core/helper_widgets/custom_app_bar.dart';
import '../../../core/helper_widgets/custom_placeholder_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> titles = [
      "UI concepts worth existing",
      "Book Review : The Design of Everyday Things by Don Norman",
      "Animes produced by Ufotable",
      "Mangas planned to read",
      "Awesome tweets collection",
      "List of free & open source apps",
      "Animes produced by Ufotable",
      "Book Review : The Design of Everyday Things by Don Norman",
    ];

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
          titles.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: titles.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 48, vertical: 20),
                            child: Text(
                              titles[index],
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                        );
                      }),
                )
              : const CustomPlaceholderScreen()
        ],
      )),
    );
  }
}
