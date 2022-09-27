import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? heigh;
  final double? width;
  final IconData icon;
  final Function() onTap;

  const CustomButton({
    super.key,
    this.icon = Icons.check,
    this.heigh = 100,
    this.width = 200,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heigh,
        width: width,
        decoration: decoration(context),
        child: const Icon(
          Icons.check,
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }

  BoxDecoration decoration(BuildContext context) {
    return BoxDecoration(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
    );
  }
}
