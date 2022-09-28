import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/screens/home/widgets/widgets.dart';

import 'package:plus_money/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      drawer: const DrawerMenu(),
      body: ChangeNotifierProvider(
        create: (_) => MenuModel(),
        child: Stack(
          children: const [
            Body(),
            Positioned(
              bottom: 8,
              child: CustomNavbar(),
            ),
          ],
        ),
      ),
    );
  }
}
