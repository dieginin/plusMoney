import 'package:flutter/material.dart';

import 'package:plus_money/screens/home/widgets/widgets.dart';

class DashDato extends StatelessWidget {
  final String titulo;

  const DashDato(this.titulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          titulo,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 35, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CustomRadialProgress(
              title: 'Anual',
              porcentaje: 75,
            ),
            CustomRadialProgress(
              title: 'Mensual',
              porcentaje: 45,
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CustomRadialProgress(
              title: 'Semanal',
              porcentaje: 69,
            ),
            CustomRadialProgress(
              title: 'Diario',
              porcentaje: 50,
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Tabla(),
      ],
    );
  }
}
