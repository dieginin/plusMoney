import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';
import 'package:plus_money/widgets/widgets.dart';

class AgregarEmpleadoScreen extends StatelessWidget {
  const AgregarEmpleadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, [mounted = true]) {
    final nombreCtrl = TextEditingController();
    final salarioCtrl = TextEditingController();

    final user = Provider.of<AuthService>(context).usuario!;
    final empleadosService = Provider.of<EmpleadosService>(context);

    return Scaffold(
      appBar: customAppBar(context, isBack: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputSpot(label: 'Nombre', child: CustomInput(controller: nombreCtrl, label: '')),
            InputSpot(label: 'Salario', child: CustomInput(controller: salarioCtrl, label: '', isMoney: true)),
            const SizedBox(height: 120),
            CustomButton(onTap: () async {
              final agregado = await empleadosService.agregar(nombreCtrl.text, salarioCtrl.text, user.eid);
              if (!agregado) return;
              if (!mounted) return;
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
