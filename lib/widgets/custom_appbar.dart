import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'package:plus_money/services/services.dart';

AppBar customAppBar(BuildContext context, {bool isBack = false}) {
  final authService = Provider.of<AuthService>(context);
  final socketService = Provider.of<SocketService>(context);

  final user = authService.usuario!;

  return AppBar(
    elevation: 0,
    leading: Builder(
        builder: (context) => IconButton(
              splashRadius: .1,
              onPressed: () => isBack ? Navigator.pop(context) : Scaffold.of(context).openDrawer(),
              icon: Icon(
                isBack ? Icons.arrow_back_ios_new_rounded : Icons.menu,
                size: 40,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )),
    actions: [
      GestureDetector(
        onTap: () {
          Clipboard.setData(const ClipboardData(text: '3876432784'));
          Fluttertoast.showToast(
            msg: "Dos clics para cerrar sesión",
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey[350],
            textColor: Theme.of(context).colorScheme.secondary,
          );
        },
        onDoubleTap: () {
          socketService.disconnect();
          authService.logout(context);
        },
        child: CircleAvatar(
          backgroundColor: isBack ? Colors.transparent : Theme.of(context).colorScheme.secondary,
          radius: 25,
          child: isBack
              ? Container()
              : Text(
                  user.iniciales(context),
                  style: const TextStyle(fontSize: 24),
                ),
        ),
      ),
      const SizedBox(width: 25),
    ],
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
}
