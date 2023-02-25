import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CuadradoAnimado()
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key? key,
  }) : super(key: key);

  @override
  State<CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> rotation;

  @override
  void initState() {
    
    
    controller = AnimationController(
      vsync: this, // implementamos SingleTickerProviderStateMixin para quitar el error
      duration: const Duration(milliseconds: 4000)

    );

    // valores iniciales de la animacion
    rotation = Tween(
      begin: 0.0,
      // end: 2.0
      end: 2 * Math.pi
    ).animate(
      // controller
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    controller.addListener(() {
      
      if( controller.status == AnimationStatus.completed){
        // controller.reverse();
        controller.reset();
      }
      // else if( controller.status == AnimationStatus.dismissed){
      //   controller.forward();
      // }
    });

    // controller.forward();

    super.initState();
  }

  @override
  void dispose() {    
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // iniciamos la animacion cuando se construye el widget
    controller.forward();
    // controller.repeat();

    return AnimatedBuilder(
      animation: controller,
      // child: _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: rotation.value,
          // child: child, 
          child: const _Rectangulo()
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  const _Rectangulo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration:const BoxDecoration(
      color: Colors.blue,

      ),
    );
  }
}