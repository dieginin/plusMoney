import 'package:flutter/material.dart';

import 'package:plus_money/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomeScreen(),
  'login': (_) => const SettingsScreen(),
  'register': (_) => const SettingsScreen(),
  'settings': (_) => const SettingsScreen(),
};
