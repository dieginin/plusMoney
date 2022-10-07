import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';
import 'package:plus_money/widgets/widgets.dart';

class EditarEmpleadoScreen extends StatelessWidget {
  const EditarEmpleadoScreen({super.key});

  @override
  Widget build(BuildContext context, [mounted = true]) {
    final nombreCtrl = TextEditingController();
    final salarioCtrl = TextEditingController();
    final empleadosService = Provider.of<EmpleadosService>(context);
    final empleado = empleadosService.empleado;

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
            InputSpot(label: 'Nombre', child: CustomInput(controller: nombreCtrl, label: empleado.nombre)),
            InputSpot(label: 'Salario', child: CustomInput(controller: salarioCtrl, label: empleado.salario <= 0 ? '' : empleado.salario.toString(), isMoney: true)),
            const SizedBox(height: 90),
            CustomButton(onTap: () {
              empleadosService.update(empleado, empleado.uid, nombreCtrl.text, salarioCtrl.text, empleado.deuda.toString());
              Fluttertoast.showToast(
                msg: 'Guardado',
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.grey[350],
                textColor: Theme.of(context).colorScheme.secondary,
              );
              Navigator.pop(context);
            }),
            const SizedBox(height: 20),
            CustomButton(
                onTap: () {
                  empleadosService.eliminar(empleado.uid, empleado.eid);
                  Fluttertoast.showToast(
                    msg: 'Eliminado',
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey[350],
                    textColor: Theme.of(context).colorScheme.secondary,
                  );
                  Navigator.pop(context);
                },
                icon: Icons.delete_outline),
          ],
        ),
      ),
    );
  }
}
