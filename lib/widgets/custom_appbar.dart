import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, {bool isBack = false}) {
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
      CircleAvatar(
        backgroundColor: isBack ? Colors.transparent : Theme.of(context).colorScheme.secondary,
        radius: 25,
        child: isBack
            ? Container()
            : const Text(
                'DB',
                style: TextStyle(fontSize: 24),
              ),
      ),
      const SizedBox(width: 25),
    ],
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
}
