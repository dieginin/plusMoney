import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text(authService.usuario!.iniciales(context)),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'login');
            AuthService.deleteToken();
          },
        ),
      ),
    );
  }
}
