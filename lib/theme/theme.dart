import 'package:flutter/material.dart';

import 'package:plus_money/theme/colors.dart';

class AppTheme {
  static const colors = AppColors();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: colors.blanco,
    hintColor: Colors.black38,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: colors.secundario,
    ),
  );
}
