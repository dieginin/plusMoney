import 'package:flutter/material.dart';

import 'package:plus_money/routes/routes.dart';
import 'package:plus_money/theme/theme.dart';

void main() => runApp(const PlusMoneyApp());

class PlusMoneyApp extends StatelessWidget {
  const PlusMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Money',
      theme: lightTheme,
      initialRoute: 'home',
      routes: appRoutes,
    );
  }
}
