import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/shared/preferences.dart';
import 'package:plus_money/routes/routes.dart';
import 'package:plus_money/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();

  runApp(const PlusMoneyApp());
}

class PlusMoneyApp extends StatelessWidget {
  const PlusMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeChanger(Preferences.isDarkmode),
      child: const MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Money',
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      initialRoute: 'home',
      routes: appRoutes,
    );
  }
}
