import 'package:flutter/material.dart';

import '/widgets/custom_app_bar.dart';
import '/cubits/notes_cubit/notes_cubit.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    NotesCubit.getObject(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: const <Widget>[
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
          ),
          // NoteItem(),
          Expanded(
            child: NotesListView(),
          ),
        ],
      ),
    );
  }
}
