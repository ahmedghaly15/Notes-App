import 'package:flutter/material.dart';

import '../widgets/edit_note_view_body.dart';

class EditeNoteView extends StatelessWidget {
  const EditeNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditNoteViewBody(),
    );
  }
}
