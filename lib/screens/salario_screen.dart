import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';
import 'package:plus_money/widgets/widgets.dart';

class SalarioScreen extends StatelessWidget {
  const SalarioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final salarioCtrl = TextEditingController();
    final fechaCtrl = TextEditingController();
    final empleadosService = Provider.of<EmpleadosService>(context);
    final empleado = empleadosService.empleado;
    DateTime now = DateTime.now();

    return Scaffold(
      appBar: customAppBar(context, isBack: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputSpot(
              label: 'Empleado',
              child: CustomDropdownEmployee(
                placeHolder: empleado.nombre == '' ? 'Seleccione' : empleado.nombre,
                employees: empleadosService.empleados!,
              ),
            ),
            InputSpot(label: 'Salario', child: CustomInput(controller: salarioCtrl, label: (empleado.salario - empleado.deuda).toString(), isMoney: true)),
            InputSpot(
              label: 'Fecha',
              child: CustomInput(
                controller: fechaCtrl,
                label: DateFormat('dd/MM/y').format(now).toString(),
              ),
            ),
            const SizedBox(height: 60),
            CustomButton(onTap: () {
              // TODO: Guardar en balance
              empleadosService.update(empleado, empleado.uid, empleado.nombre, empleado.salario.toString(), '0');
              Fluttertoast.showToast(
                msg: 'Guardado',
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey[350],
                textColor: Theme.of(context).colorScheme.secondary,
              );
              Navigator.pop(context);
            }),
          ],
        ),
      ),
    );
  }
}
