import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cubits/notes_cubit/notes_cubit.dart';
import '/cubits/notes_cubit/notes_states.dart';
import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesStates>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          physics: const BouncingScrollPhysics(),
          itemCount: NotesCubit.getObject(context).notes!.length,
          itemBuilder: (context, index) {
            return NoteItem(
              noteModel: NotesCubit.getObject(context).notes![index],
            );
          },
        ),
      );
    });
  }
}
