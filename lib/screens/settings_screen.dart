import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';
import 'package:plus_money/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, [mounted = true]) {
    final nombreCtrl = TextEditingController();
    final userCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    final authService = Provider.of<AuthService>(context);
    final user = authService.usuario!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: customAppBar(context, isBack: true),
      body: Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ajustes',
              style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            InputSpot(
              label: 'Foto',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 50,
                    child: Text(
                      user.iniciales(context),
                      style: const TextStyle(fontSize: 50),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Subir Imagen',
                    style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
                  ),
                ],
              ),
            ),
            InputSpot(label: 'Nombre', child: CustomInput(label: user.nombre, controller: nombreCtrl)),
            InputSpot(label: 'Usuario', child: CustomInput(label: user.usuario, controller: userCtrl)),
            InputSpot(label: 'Contraseña', child: CustomInput(label: '', controller: passCtrl)),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.center,
              child: CustomButton(onTap: () async {
                await authService.update(user, user.uid, nombreCtrl.text, userCtrl.text, passCtrl.text);
                Fluttertoast.showToast(
                  msg: 'Guardado',
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.grey[350],
                  textColor: theme.colorScheme.secondary,
                );
                if (!mounted) return;
                Navigator.pop(context);
              }),
            ),
          ],
        ),
      ),
    );
  }
}
