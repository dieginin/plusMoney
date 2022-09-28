import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.secondary,
                      child: const Text('DB', style: TextStyle(fontSize: 35)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Diego Balestra',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(),
                  _IdEquipo(),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  const DrawerTitulo('Empleados'),
                  DrawerSubtitulo('Agregar empleados', onTap: () {}),
                  DrawerSubtitulo('Editar empleados', onTap: () {}),
                  const DrawerTitulo('Salarios'),
                  DrawerSubtitulo('Registrar préstamo', onTap: () {}),
                  DrawerSubtitulo('Registrar salario', onTap: () {}),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 65,
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {},
                child: Icon(FontAwesomeIcons.gear, color: Theme.of(context).colorScheme.secondary),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _IdEquipo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Clipboard.setData(const ClipboardData(text: '3876432784'));
        Fluttertoast.showToast(
          msg: "Copiado al portapapeles",
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.grey[350],
          textColor: Theme.of(context).colorScheme.secondary,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text('ID equipo:', style: TextStyle(color: Colors.black38)),
          SizedBox(width: 10),
          Text('3876432784', style: TextStyle(color: Colors.black38)),
          SizedBox(width: 10),
          Icon(FontAwesomeIcons.arrowUpRightFromSquare, size: 15, color: Colors.black38),
        ],
      ),
    );
  }
}

class DrawerSubtitulo extends StatelessWidget {
  final String subTitulo;
  final Function()? onTap;

  const DrawerSubtitulo(this.subTitulo, {super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 48,
        child: Row(
          children: [
            const Icon(Icons.subdirectory_arrow_right, color: Colors.black12),
            const SizedBox(width: 5),
            Text(subTitulo, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, color: Colors.black12, size: 20),
          ],
        ),
      ),
    );
  }
}

class DrawerTitulo extends StatelessWidget {
  final String titulo;

  const DrawerTitulo(this.titulo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
        ],
      ),
    );
  }
}
