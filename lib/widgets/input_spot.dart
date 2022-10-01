import 'package:flutter/material.dart';

class InputSpot extends StatelessWidget {
  final String label;
  final AlignmentGeometry align;
  final Widget child;

  const InputSpot({
    super.key,
    required this.label,
    required this.child,
    this.align = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Row(
        crossAxisAlignment: align == Alignment.center ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: size.width * .35,
            child: Text(
              label,
              style: TextStyle(fontSize: 20, color: Theme.of(context).hintColor),
            ),
          ),
          Expanded(
            child: Container(
              alignment: align,
              child: child,
            ),
          )
        ],
      ),
    );
  }
}
