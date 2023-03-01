import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CircularProgessPage extends StatefulWidget {
  const CircularProgessPage({super.key});

  @override
  State<CircularProgessPage> createState() => _CircularProgessPageState();
}

class _CircularProgessPageState extends State<CircularProgessPage> with SingleTickerProviderStateMixin {

  late AnimationController animationController;

  double procentajeVisible = 0.0;
  double nuevoProcentajeVisible = 0.0;

  @override
  void initState() {

    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 800));

    animationController.addListener(() {

      procentajeVisible = lerpDouble(procentajeVisible, nuevoProcentajeVisible, animationController.value)!;
      setState(() {});

    });
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon( Icons.add ),
        onPressed: () {

          procentajeVisible = nuevoProcentajeVisible;
          nuevoProcentajeVisible += 10;
          if(nuevoProcentajeVisible > 100){
            nuevoProcentajeVisible = 10;
            procentajeVisible = 0;
          }

          // indicamos el momento el cual tiene que ejecutar el listener, que puede ser de 0 a 1
          animationController.forward(from: 0.0);

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