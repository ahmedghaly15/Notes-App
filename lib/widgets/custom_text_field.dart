import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final int maxLines;
  const CustomTextField({super.key, required this.hint, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: primaryColor,
      maxLines: maxLines,
      textCapitalization: TextCapitalization.sentences,
      enableSuggestions: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        enabledBorder: buildBorder(color: Colors.white),
        focusedBorder: buildBorder(color: primaryColor),
        hintText: hint,
        hintStyle: const TextStyle(color: primaryColor),
      ),
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
