import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_icon.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final IconData icon;
  const CustomAppBar({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            letterSpacing: 1,
          ),
        ),
        const Spacer(),
        CustomIcon(icon: icon),
      ],
    );
  }
}
