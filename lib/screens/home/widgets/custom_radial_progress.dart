import 'dart:math';

import 'package:flutter/material.dart';

class CustomRadialProgress extends StatelessWidget {
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double porcentaje;
  final String? title;

  const CustomRadialProgress({
    super.key,
    required this.porcentaje,
    this.title,
    this.colorPrimario,
    this.colorSecundario,
  });

  @override
  Widget build(BuildContext context) {
    return title != null
        ? Column(
            children: [
              Text(
                title!,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w300,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 125,
                height: 125,
                child: Grafica(
                  porcentaje: porcentaje,
                  colorPrimario: colorPrimario,
                  colorSecundario: colorSecundario,
                ),
              ),
            ],
          )
        : Column(
            children: [
              const SizedBox(height: 25),
              SizedBox(
                width: 125,
                height: 125,
                child: Grafica(
                  porcentaje: porcentaje,
                  colorPrimario: colorPrimario,
                  colorSecundario: colorSecundario,
                ),
              ),
            ],
          );
  }
}

class Grafica extends StatefulWidget {
  final Color? colorPrimario;
  final Color? colorSecundario;
  final double porcentaje;

  const Grafica({
    super.key,
    required this.porcentaje,
    this.colorPrimario,
    this.colorSecundario,
  });

  @override
  State<Grafica> createState() => _GraficaState();
}

class _GraficaState extends State<Grafica> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late double porcentajeAnterior;

  @override
  void initState() {
    porcentajeAnterior = widget.porcentaje;
    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 200));

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorPrimario = widget.colorPrimario ?? Theme.of(context).primaryColor;
    final colorSecundario = widget.colorSecundario ?? Theme.of(context).colorScheme.secondary;

    controller.forward(from: 0);

    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          child: CustomPaint(
            painter: _MiRadialProgress(
              (widget.porcentaje - diferenciaAnimar) + (diferenciaAnimar * controller.value),
              colorPrimario,
              colorSecundario,
              Theme.of(context),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.porcentaje.toInt()}%',
                  style: TextStyle(color: colorPrimario, fontSize: 20, fontWeight: FontWeight.w200),
                ),
                Text(
                  '${(100 - widget.porcentaje).toInt()}%',
                  style: TextStyle(color: colorSecundario, fontSize: 20, fontWeight: FontWeight.w200),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MiRadialProgress extends CustomPainter {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final ThemeData theme;

  _MiRadialProgress(this.porcentaje, this.colorPrimario, this.colorSecundario, this.theme);

  @override
  void paint(Canvas canvas, Size size) {
    // Sombra
    final path = Path();
    final sombra = Paint()
      ..color = theme.scaffoldBackgroundColor
      ..style = PaintingStyle.fill;

    // Circulo completado
    final paint = Paint()
      ..strokeWidth = 15
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    final Offset center = Offset(size.width * .5, size.height * .5);
    final double radio = min(size.width * .5, size.height * .5);

    // Sombra
    path.addOval(Rect.fromCircle(center: center, radius: radio + 11));
    canvas.drawShadow(path, theme.shadowColor, 3, true);
    canvas.drawCircle(center, radio, sombra);

    // Base
    canvas.drawCircle(center, radio, paint);

    // Arco
    final paintArco = Paint()
      ..strokeWidth = 15
      ..color = colorPrimario
      ..style = PaintingStyle.stroke;

    // Parte que se deberá llenar
    double arcAngle = 2 * pi * (porcentaje / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radio),
      -pi / 2,
      arcAngle,
      false,
      paintArco,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
