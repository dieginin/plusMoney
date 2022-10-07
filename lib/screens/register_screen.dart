import 'package:flutter/material.dart';
import 'package:plus_money/widgets/widgets.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';
import 'package:plus_money/theme/theme.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                    Text('Registrarse', style: Theme.of(context).textTheme.headline4),
                    _LoginForm(),
                  ],
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, 'login'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text('¿Ya tienes cuenta?', style: TextStyle(fontSize: 18, color: AppTheme.colors.secundario)),
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
    final nombreCtrl = TextEditingController();
    final userCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final eidCtrl = TextEditingController();
    final authService = Provider.of<AuthService>(context);

    return Form(
      child: Column(
        children: [
          CustomInput(
            controller: nombreCtrl,
            label: 'Nombre',
            isLogin: true,
          ),
          const SizedBox(height: 15),
          CustomInput(
            controller: userCtrl,
            label: 'Usuario',
            isLogin: true,
          ),
          const SizedBox(height: 15),
          CustomInput(
            controller: passCtrl,
            label: 'Contraseña',
            obscureText: true,
            isLogin: true,
          ),
          const SizedBox(height: 15),
          CustomInput(
            controller: eidCtrl,
            label: 'ID de equipo*',
            isLogin: true,
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
                    var registerOk = await authService.register(nombreCtrl.text.trim(), userCtrl.text.trim(), passCtrl.text.trim(), eidCtrl.text.trim());

                    if (!mounted) return;

                    if (registerOk == true) {
                      Navigator.pushReplacementNamed(context, 'home');
                    } else {
                      registerOk ??= 'Nombre, Usuario y Contraseña son requeridos.';
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registro incorrecto\n$registerOk', textAlign: TextAlign.center)));
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
