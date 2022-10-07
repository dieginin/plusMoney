import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> items;
  final String placeHolder;

  const CustomDropdown({
    super.key,
    required this.items,
    this.placeHolder = 'Seleccione',
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String placeHolder = 'Seleccione';
  final List<DropdownMenuItem<String>> items = [];

  @override
  Widget build(BuildContext context) {
    if (placeHolder == 'Seleccione') placeHolder = widget.placeHolder;

    items.clear();
    for (String item in widget.items) {
      items.add(DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: item == placeHolder ? TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600) : null,
        ),
      ));
    }

    return DropdownButton(
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      hint: Text(placeHolder, style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
      icon: Icon(Icons.keyboard_arrow_down_outlined, color: Theme.of(context).colorScheme.secondary),
      style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 20),
      underline: Container(),
      items: items,
      onChanged: (value) {
        setState(() => placeHolder = value!);
      },
    );
  }
}
