import 'dart:math';

import 'package:flutter/material.dart';

class CircularProgessPage extends StatefulWidget {
  const CircularProgessPage({super.key});

  @override
  State<CircularProgessPage> createState() => _CircularProgessPageState();
}

class _CircularProgessPageState extends State<CircularProgessPage> {
  double procentajeVisible = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {
          procentajeVisible += 10;
          if(procentajeVisible > 100){
            procentajeVisible = 0;
          }

          setState(() {});
        },
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          height: 300,
          width: 300,
          color: Colors.red,
          child: CustomPaint(
            painter: _RadialProgressPaint(procentajeVisible: procentajeVisible)
          ),
        )
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
      ..color = Colors.green
      ..style = PaintingStyle.stroke;

    final center = Offset(size.width * 0.5, size.height * 0.5);
    final radius = min(size.width / 2, size.height / 2 );
    canvas.drawCircle(center, radius, paint);

    final paintArco = Paint()
      ..strokeWidth = 10
      ..color = Colors.blue
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