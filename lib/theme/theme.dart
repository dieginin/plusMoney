import 'package:flutter/material.dart';

import 'package:plus_money/theme/colors.dart';

class AppTheme {
  static const colors = AppColors();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    hintColor: Colors.black38,
    primaryColor: colors.primario,
    scaffoldBackgroundColor: colors.blanco,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: colors.secundario,
    ),
  );
}
