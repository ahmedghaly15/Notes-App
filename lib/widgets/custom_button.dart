import 'package:flutter/material.dart';
import 'package:notes_app/shared/constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;

  final double height;
  final double width;
  final void Function()? onPressed;
  final TextStyle? textStyle;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.height = 15,
    this.width = 130,
    this.textStyle = const TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      letterSpacing: 0.5,
      color: Colors.white,
    ),
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: width,
            vertical: height,
          ),
        ),
        backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
      child: isLoading
          ? const CircularProgressIndicator(
              color: Colors.black,
            )
          : Text(
              buttonText,
              style: textStyle,
            ),
    );
  }
}
