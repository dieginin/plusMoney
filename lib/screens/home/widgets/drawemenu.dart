import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);
    final user = authService.usuario!;

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
                      child: Text(user.iniciales(context), style: const TextStyle(fontSize: 35)),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    user.nombre,
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
                  DrawerSubtitulo('Agregar empleados', onTap: () => Navigator.pushNamed(context, 'agregar')),
                  DrawerSubtitulo('Editar empleados', onTap: () => Navigator.pushNamed(context, 'editar')),
                  const DrawerTitulo('Salarios'),
                  DrawerSubtitulo('Registrar préstamo', onTap: () => Navigator.pushNamed(context, 'prestamo')),
                  DrawerSubtitulo('Registrar salario', onTap: () => Navigator.pushNamed(context, 'salario')),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              height: 65,
              alignment: Alignment.topRight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      socketService.disconnect();
                      authService.logout(context);
                    },
                    child: Icon(FontAwesomeIcons.rightFromBracket, color: Theme.of(context).colorScheme.secondary),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.popAndPushNamed(context, 'settings'),
                    child: Icon(FontAwesomeIcons.gear, color: Theme.of(context).colorScheme.secondary),
                  ),
                ],
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
    final user = Provider.of<AuthService>(context).usuario!;

    return GestureDetector(
      onTap: () {
        Clipboard.setData(ClipboardData(text: user.eid));
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
        children: [
          Text('ID equipo:', style: TextStyle(color: Theme.of(context).hintColor)),
          const SizedBox(width: 10),
          Text(user.eid, style: TextStyle(color: Theme.of(context).hintColor)),
          const SizedBox(width: 10),
          Icon(FontAwesomeIcons.arrowUpRightFromSquare, size: 15, color: Theme.of(context).hintColor),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text(
            titulo,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
