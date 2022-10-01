import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/shared/preferences.dart';
import 'package:plus_money/theme/theme.dart';
import 'package:plus_money/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

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
                    child: const Text(
                      'DB',
                      style: TextStyle(fontSize: 50),
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
            const InputSpot(label: 'Nombre', child: CustomInput()),
            const InputSpot(label: 'Email', child: CustomInput()),
            InputSpot(
              label: 'Modo Obscuro',
              align: Alignment.centerRight,
              child: Switch.adaptive(
                activeColor: theme.currentTheme.colorScheme.secondary,
                value: Preferences.isDarkmode,
                onChanged: (value) {
                  Preferences.isDarkmode = value;
                  final themeProvider = Provider.of<ThemeChanger>(context, listen: false);

                  value ? themeProvider.setDarkMode() : themeProvider.setLightMode();
                },
              ),
            ),
            const SizedBox(height: 60),
            Align(
              alignment: Alignment.center,
              child: CustomButton(onTap: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
