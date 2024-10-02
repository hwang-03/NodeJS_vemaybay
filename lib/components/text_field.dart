import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  const FormTextField(
      {super.key,
      this.controller,
      this.hintText,
      this.labelText,
      this.textInputAction,
      this.errorText});
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 18.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.lightBlue),
        labelText: labelText,
        errorText: errorText,
      ),
      textInputAction: textInputAction,
    );
  }
}
