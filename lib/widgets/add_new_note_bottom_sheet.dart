import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_button.dart';

import 'custom_text_field.dart';

class AddNewNoteBottomSheet extends StatelessWidget {
  const AddNewNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 24,
            ),
            const CustomTextField(hint: 'Title'),
            const SizedBox(
              height: 16,
            ),
            const CustomTextField(
              hint: 'Content',
              maxLines: 5,
            ),
            const SizedBox(
              height: 32,
            ),
            CustomButton(
              height: 8,
              width: 150,
              buttonText: "Add",
              onPressed: () {},
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
