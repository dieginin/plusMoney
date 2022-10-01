import 'package:flutter/material.dart';

import 'package:plus_money/widgets/widgets.dart';

class AgregarEmpleadoScreen extends StatelessWidget {
  const AgregarEmpleadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, isBack: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputSpot(label: 'Nombre', child: CustomInput()),
            const InputSpot(label: 'Salario', child: CustomInput()),
            const SizedBox(height: 120),
            CustomButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
