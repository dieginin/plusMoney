import 'package:flutter/material.dart';

import 'package:plus_money/widgets/widgets.dart';

class SalarioScreen extends StatelessWidget {
  const SalarioScreen({Key? key}) : super(key: key);

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
            const InputSpot(label: 'Salario', child: CustomInput()),
            const InputSpot(
                label: 'Mes',
                child: CustomDropdown(
                  items: ['Enero', 'Febrero', 'Marzo'],
                )),
            const InputSpot(label: 'Semana', child: CustomInput()),
            const InputSpot(label: 'Fecha', child: CustomInput()),
            const SizedBox(height: 60),
            CustomButton(onTap: () {}),
          ],
        ),
      ),
    );
  }
}
