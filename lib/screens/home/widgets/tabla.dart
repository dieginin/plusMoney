import 'package:flutter/material.dart';

class Tabla extends StatelessWidget {
  const Tabla({super.key});

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Theme.of(context).scaffoldBackgroundColor),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            Container(),
            const _TablaTitulo('Actual'),
            const _TablaTitulo('Pasado'),
          ],
        ),
        _tablaDato(context, 'Anual', '\$25,000.0', '\$75,000.0'),
        _tablaDato(context, 'Mensual', '\$55,000.0', '\$45,000.0'),
        _tablaDato(context, 'Semanal', '\$31,000.0', '\$69,000.0'),
        _tablaDato(context, 'Diario', '\$50,000.0', '\$50,000.0'),
      ],
    );
  }

  TableRow _tablaDato(BuildContext context, String titulo, String actual, String pasado) {
    return TableRow(
      children: [
        Center(
            child: Text(
          titulo,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 16, fontWeight: FontWeight.w300),
        )),
        Center(
            child: Text(
          actual,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.w300),
        )),
        Center(
            child: Text(
          pasado,
          style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.w300),
        )),
      ],
    );
  }
}

class _TablaTitulo extends StatelessWidget {
  final String label;

  const _TablaTitulo(this.label);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.w500, color: Theme.of(context).colorScheme.secondary, fontSize: 16),
      ),
    );
  }
}
