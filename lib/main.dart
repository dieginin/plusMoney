import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:plus_money/theme/theme.dart';
import 'package:plus_money/widgets/widgets.dart';

void main() => runApp(const PlusMoneyApp());

class PlusMoneyApp extends StatelessWidget {
  const PlusMoneyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '+Money',
      theme: lightTheme,
      home: Scaffold(
        body: Center(
          child: CustomNavbar(),
        ),
      ),
    );
  }
}
