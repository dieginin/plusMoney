import 'package:flutter/material.dart';

import 'package:plus_money/widgets/widgets.dart';

class EditarEmpleadoScreen extends StatelessWidget {
  const EditarEmpleadoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, isBack: true),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const InputSpot(
              label: 'Empleado',
              child: CustomDropdown(
                items: ['Diego', 'Marcelo', 'Tio'],
              ),
            ),
            const InputSpot(label: 'Nombre', child: CustomInput()),
            const InputSpot(label: 'Salario', child: CustomInput()),
            const SizedBox(height: 90),
            CustomButton(onTap: () {}),
            const SizedBox(height: 20),
            CustomButton(onTap: () {}, icon: Icons.delete_outline),
          ],
        ),
      ),
    );
  }
}
