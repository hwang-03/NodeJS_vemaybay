import 'package:flutter/material.dart';

class FormElevatedButton extends StatelessWidget {
  const FormElevatedButton(
      {super.key,
      this.onPressed,
      required this.text,
      this.color = Colors.blueAccent,
      this.textColor = Colors.red});
  final Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 25.0),
        ));
  }
}
