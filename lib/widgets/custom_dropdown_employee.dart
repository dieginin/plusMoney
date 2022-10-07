import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/models/models.dart';
import 'package:plus_money/services/services.dart';

class CustomDropdownEmployee extends StatefulWidget {
  final List<Empleado> employees;
  final String? placeHolder;

  const CustomDropdownEmployee({
    super.key,
    required this.employees,
    this.placeHolder = 'Seleccione',
  });

  @override
  State<CustomDropdownEmployee> createState() => _CustomDropdownEmployeeState();
}

class _CustomDropdownEmployeeState extends State<CustomDropdownEmployee> {
  String placeHolder = 'Seleccione';
  final List<DropdownMenuItem<Empleado>> items = [];

  @override
  Widget build(BuildContext context) {
    final empleadosService = Provider.of<EmpleadosService>(context);

    if (placeHolder == 'Seleccione') placeHolder = widget.placeHolder!;

    items.clear();
    for (Empleado item in widget.employees) {
      items.add(DropdownMenuItem(
        value: item,
        child: Text(
          item.nombre,
          style: item.nombre == placeHolder ? TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600) : null,
        ),
      ));
    }

    return DropdownButton(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      hint: Text(placeHolder, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
      icon: Icon(Icons.keyboard_arrow_down_outlined, color: Theme.of(context).colorScheme.secondary),
      style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20),
      underline: Container(),
      items: items,
      onChanged: (value) {
        empleadosService.empleado = Empleado(
          nombre: value!.nombre,
          salario: value.salario,
          deuda: value.deuda,
          eid: value.eid,
          uid: value.uid,
        );
        setState(() {
          placeHolder = value.nombre;
        });
      },
    );
  }
}
