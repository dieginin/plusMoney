import 'package:flutter/material.dart';
import 'package:plus_money/widgets/widgets.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';
import 'package:plus_money/theme/theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 300),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                height: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Iniciar Sesión', style: Theme.of(context).textTheme.headline4),
                    _LoginForm(),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'register'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text('Crear una nueva cuenta', style: TextStyle(fontSize: 18, color: AppTheme.colors.secundario)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context, [mounted = true]) {
    final userCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    return Form(
      child: Column(
        children: [
          CustomInput(
            controller: userCtrl,
            label: 'Usuario',
          ),
          const SizedBox(height: 40),
          CustomInput(
            controller: passCtrl,
            label: 'Contraseña',
            obscureText: true,
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.colors.secundarioAccent,
              elevation: 0,
              shape: const CircleBorder(),
            ),
            onPressed: authService.autenticando
                ? null
                : () async {
                    FocusScope.of(context).unfocus();
                    var loginOk = await authService.login(userCtrl.text.trim(), passCtrl.text.trim());

                    if (!mounted) return;

                    if (loginOk == true) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      loginOk ??= 'Llene todos los campos';
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Inicio incorrecto\n$loginOk', textAlign: TextAlign.center)));
                    }
                  },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: authService.autenticando ? CircularProgressIndicator(color: AppTheme.colors.primario) : Icon(Icons.arrow_forward, color: AppTheme.colors.blanco, size: 36),
            ),
          ),
        ],
      ),
    );
  }
}
