import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Fondo(),
          _HeaderIcon(),
          child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(top: 50),
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: double.infinity,
          height: 180,
        ),
      ),
    );
  }
}

class _Fondo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Stack(
        children: [
          Positioned(top: -50, left: -120, child: _Bubble()),
          Positioned(top: -150, left: 200, child: _Bubble()),
        ],
      ),
    );
  }
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: const Color.fromRGBO(255, 255, 255, .25),
      ),
    );
  }
}
