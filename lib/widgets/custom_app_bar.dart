import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        Text(
          "Notes",
          style: TextStyle(
            fontSize: 28,
            letterSpacing: 1,
          ),
        ),
        Spacer(),
        CustomSearchIcon(),
      ],
    );
  }
}
