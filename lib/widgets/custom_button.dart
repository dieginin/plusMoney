import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? heigh;
  final double? width;
  final IconData icon;
  final Function() onTap;

  const CustomButton({
    super.key,
    this.icon = Icons.check,
    this.heigh = 60,
    this.width = 180,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigh,
        width: width,
        decoration: decoration(context, icon),
        child: Icon(
          icon,
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  BoxDecoration decoration(BuildContext context, IconData icon) {
    return BoxDecoration(
      color: icon == Icons.check ? Theme.of(context).primaryColor : Colors.redAccent,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
