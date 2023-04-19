import 'package:flutter/material.dart';

import '../../notes_view/widgets/colors_list_view.dart';
import '/models/note_model.dart';
import '/shared/constants.dart';

class EditNoteColorsListView extends StatefulWidget {
  final NoteModel note;
  const EditNoteColorsListView({super.key, required this.note});

  @override
  State<EditNoteColorsListView> createState() => _EditNoteColorsListViewState();
}

class _EditNoteColorsListViewState extends State<EditNoteColorsListView> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.note.color!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23 * 2,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () {
            currentIndex = index;
            widget.note.color = kColors[index].value;
            setState(() {});
          },
          child: ColorItem(
            isSelected: currentIndex == index,
            color: kColors[index],
          ),
        ),
        separatorBuilder: (context, index) => const SizedBox(
          width: 6,
        ),
        itemCount: kColors.length,
      ),
    );
  }
}
