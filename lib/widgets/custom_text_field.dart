import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  const CustomTextFormField(
      {super.key, required this.hint, this.maxLines = 1, this.onSaved});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      textCapitalization: TextCapitalization.sentences,
      enableSuggestions: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: buildBorder(color: Colors.white),
        focusedBorder: buildBorder(color: kPrimaryColor),
        errorBorder: buildBorder(color: Colors.red),
        hintText: hint,
        hintStyle: const TextStyle(color: kPrimaryColor),
      ),
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Can't be blank";
        }
        return null;
      },
    );
  }

  OutlineInputBorder buildBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: BorderSide(
        color: color,
        width: 2,
      ),
    );
  }
}
