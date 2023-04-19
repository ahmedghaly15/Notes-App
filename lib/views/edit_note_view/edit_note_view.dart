import 'package:flutter/material.dart';

import '/models/note_model.dart';
import 'widgets/edit_note_view_body.dart';

class EditeNoteView extends StatelessWidget {
  final NoteModel note;
  const EditeNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note),
    );
  }
}
