import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;

  const CustomInput({
    super.key,
    required this.controller,
    required this.label,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: decoration(context, label),
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
    );
  }

  InputDecoration decoration(context, label) {
    return InputDecoration(
      isDense: true,
      hintText: label,
      border: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).hintColor),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
      ),
    );
  }
}
