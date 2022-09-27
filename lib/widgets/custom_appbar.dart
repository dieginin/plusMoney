import 'package:flutter/material.dart';

import 'package:plus_money/theme/theme.dart';

class CustomAppBar extends StatelessWidget {
  final IconData? leading;
  final Function() onLeadingPressed;
  final bool withAvatar;

  const CustomAppBar({
    super.key,
    this.leading = Icons.menu,
    this.withAvatar = true,
    required this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: onLeadingPressed,
              icon: Icon(
                leading,
                size: 40,
                color: lightTheme.colorScheme.secondary,
              ),
            ),
            CircleAvatar(
              backgroundColor: withAvatar ? lightTheme.colorScheme.secondary : Colors.transparent,
              radius: 30,
              child: withAvatar
                  ? const Text(
                      'DB',
                      style: TextStyle(fontSize: 28),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
