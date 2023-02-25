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
  late Animation<double> opacidad;
  late Animation<double> moverDerecha;
  late Animation<double> agrandar;

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

    // opacidad = Tween( begin: 0.1, end: 1.0).animate(controller);
    opacidad = Tween( begin: 0.1, end: 1.0).animate(
      // CurvedAnimation(parent: controller, curve: Curves.easeOut)
      CurvedAnimation(parent: controller, curve: const Interval(
        0, // va de 0 a 1, toma un % del duration
        0.25, 
        curve: Curves.easeOut
      ))

    );

    moverDerecha = Tween(begin: 0.1, end: 200.1).animate(controller);

    agrandar = Tween(begin: 0.0, end: 2.0).animate(controller);

    controller.addListener(() {
      
      if( controller.status == AnimationStatus.completed){
        // controller.reverse();
        controller.repeat();
        // controller.reset();
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
      child: const _Rectangulo(),
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value,0),// x e y
          child: Transform.rotate(
            angle: rotation.value,
            // child: const _Rectangulo(), // se constrye cada vez que se retorna
            // se contruye una sola vez y se pasa por referencia
            child: Opacity(
              opacity: opacidad.value,
              child: Transform.scale(
                scale: agrandar.value,
                child: child
              ),
            ), 
          ),
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