import 'package:flutter/material.dart';

AppBar customAppBar(BuildContext context, {bool withAvatar = true}) {
  return AppBar(
    elevation: 0,
    leading: Builder(
        builder: (context) => IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                size: 40,
                color: Theme.of(context).colorScheme.secondary,
              ),
            )),
    actions: [
      CircleAvatar(
        backgroundColor: withAvatar ? Theme.of(context).colorScheme.secondary : Colors.transparent,
        radius: 25,
        child: withAvatar
            ? const Text(
                'DB',
                style: TextStyle(fontSize: 24),
              )
            : Container(),
      ),
      const SizedBox(width: 25),
    ],
    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  );
}
