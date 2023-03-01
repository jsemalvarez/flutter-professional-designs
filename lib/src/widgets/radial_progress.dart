import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {

  final porcentaje;

  const RadialProgress({super.key, this.porcentaje});

  @override
  State<RadialProgress> createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(
        painter: _RadialProgressPaint(procentajeVisible: widget.porcentaje) 
      ),
    );
  }
}

class _RadialProgressPaint extends CustomPainter{

  final double procentajeVisible;

  _RadialProgressPaint({ required this.procentajeVisible });

  @override
  void paint(Canvas canvas, Size size) {    

    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.grey
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width / 2, size.height / 2 );
    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.pink
      ..style = PaintingStyle.stroke;

    final arcAngle = 2 * pi * (procentajeVisible / 100);
    
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius), 
      -pi / 2, 
      arcAngle, 
      false, 
      paintArco
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}