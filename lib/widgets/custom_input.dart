import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final bool isMoney;
  final bool isLogin;
  final bool readOnly;

  const CustomInput({
    super.key,
    required this.controller,
    this.label = '',
    this.obscureText = false,
    this.isMoney = false,
    this.isLogin = false,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: !readOnly,
      controller: controller,
      obscureText: obscureText,
      textAlign: TextAlign.center,
      decoration: decoration(context, label),
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
    );
  }

  InputDecoration decoration(context, label) {
    return InputDecoration(
      isDense: isLogin,
      prefixIcon: isMoney ? const Icon(Icons.attach_money) : null,
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
