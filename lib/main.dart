import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/routes/routes.dart';
import 'package:plus_money/services/services.dart';
import 'package:plus_money/theme/theme.dart';

void main() async => runApp(const PlusMoneyApp());

class PlusMoneyApp extends StatelessWidget {
  const PlusMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '+Money',
        initialRoute: 'loading',
        routes: appRoutes,
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
