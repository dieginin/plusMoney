import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xffF7F7F7),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xff2196F3),
    secondary: const Color(0xff142850),
  ),
);
