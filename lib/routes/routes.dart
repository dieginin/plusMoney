import 'package:flutter/material.dart';

import 'package:plus_money/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomeScreen(),
  'loading': (_) => const LoadingScreen(),
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
};
