import 'package:flutter/material.dart';

class ThemeChanger with ChangeNotifier {
  ThemeData currentTheme;

  ThemeChanger(bool isDarkMode) : currentTheme = isDarkMode ? darkTheme : lightTheme;

  setLightMode() {
    currentTheme = lightTheme;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = darkTheme;
    notifyListeners();
  }
}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  dividerColor: Colors.black38,
  hintColor: Colors.black38,
  shadowColor: const Color(0xff000000),
  primaryColor: const Color(0xff2196F3),
  scaffoldBackgroundColor: const Color(0xffF7F7F7),
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: const Color(0xff2196F3),
    secondary: const Color(0xff142850),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  dividerColor: Colors.white38,
  hintColor: Colors.white38,
  shadowColor: Colors.white38,
  primaryColor: Colors.cyan,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    brightness: Brightness.dark,
    primary: Colors.cyan,
    secondary: Colors.indigo[200],
  ),
);
