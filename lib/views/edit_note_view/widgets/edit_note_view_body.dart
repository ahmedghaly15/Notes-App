import 'package:flutter/material.dart';

import '/cubits/notes_cubit/notes_cubit.dart';
import '/models/note_model.dart';
import '/widgets/custom_app_bar.dart';
import '/widgets/custom_text_field.dart';
import 'edit_note_colors_list_view.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = subTitle ?? widget.note.subTitle;
              widget.note.save();
              NotesCubit.getObject(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextFormField(
            hint: widget.note.title!,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextFormField(
            hint: widget.note.subTitle!,
            maxLines: 5,
            onChanged: (value) {
              subTitle = value;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsListView(note: widget.note),
        ],
      ),
    );
  }
}
