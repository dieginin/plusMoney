import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/widgets/widgets.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final seleccionado = Provider.of<MenuModel>(context).itemSeleccionado;
      return seleccionado == 0 ? const Center(child: Text('Dashboard')) : const Center(child: Text('Balance General'));
    });
  }
}
