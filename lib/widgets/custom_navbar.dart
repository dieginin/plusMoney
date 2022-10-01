import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:provider/provider.dart';

import 'package:plus_money/theme/theme.dart';

class NavBarButton {
  final IconData icon;
  final Function onPressed;

  NavBarButton({
    required this.icon,
    required this.onPressed,
  });
}

class CustomNavbar extends StatelessWidget {
  static List<NavBarButton> items = [
    NavBarButton(
      icon: FontAwesomeIcons.chartSimple,
      onPressed: () {},
    ),
    NavBarButton(
      icon: FontAwesomeIcons.moneyBillTransfer,
      onPressed: () {},
    ),
  ];

  const CustomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: SizedBox(
        width: size.width,
        child: Row(
          children: [
            const Spacer(),
            _MenuBackground(child: _MenuItems(items)),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class _MenuBackground extends StatelessWidget {
  final Widget child;

  const _MenuBackground({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration(context),
      width: 300,
      height: 60,
      child: child,
    );
  }

  BoxDecoration decoration(context) {
    final theme = Provider.of<ThemeChanger>(context).currentTheme;

    return BoxDecoration(
      color: theme == lightTheme ? Colors.white : Colors.grey[900],
      borderRadius: BorderRadius.circular(100),
      boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: -2, color: Theme.of(context).hintColor)],
    );
  }
}

class _MenuItems extends StatelessWidget {
  final List<NavBarButton> menuItems;

  const _MenuItems(this.menuItems);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(menuItems.length, (i) => _MenuButton(i, menuItems[i])),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final int i;
  final NavBarButton item;

  const _MenuButton(this.i, this.item);

  @override
  Widget build(BuildContext context) {
    final menuModel = Provider.of<MenuModel>(context);

    return GestureDetector(
      onTap: () {
        Provider.of<MenuModel>(context, listen: false).itemSeleccionado = i;
        item.onPressed();
      },
      behavior: HitTestBehavior.translucent,
      child: Icon(
        item.icon,
        size: menuModel.itemSeleccionado == i ? 30 : 20,
        color: menuModel.itemSeleccionado == i ? Theme.of(context).primaryColor : const Color(0xff607D8B),
      ),
    );
  }
}

class MenuModel with ChangeNotifier {
  int _itemSeleccionado = 0;

  int get itemSeleccionado => _itemSeleccionado;
  set itemSeleccionado(int index) {
    _itemSeleccionado = index;
    notifyListeners();
  }
}
