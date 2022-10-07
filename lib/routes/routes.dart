import 'package:flutter/material.dart';

import 'package:plus_money/screens/screens.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'home': (_) => const HomeScreen(),
  'loading': (_) => const LoadingScreen(),
  'login': (_) => const LoginScreen(),
  'register': (_) => const RegisterScreen(),
  'settings': (_) => const SettingsScreen(),
  'agregar': (_) => const AgregarEmpleadoScreen(),
  'editar': (_) => const EditarEmpleadoScreen(),
  'prestamo': (_) => const PrestamoScreen(),
  'salario': (_) => const SalarioScreen(),
};
