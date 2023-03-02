import 'package:flutter/material.dart';

class AnimacionesTetoPage extends StatelessWidget {
  const AnimacionesTetoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _CuadradoAnimado()
      ),
    );
  }
}


class _CuadradoAnimado extends StatefulWidget {
  const _CuadradoAnimado({super.key});

  @override
  State<_CuadradoAnimado> createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<_CuadradoAnimado> with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<double> moverDerecha;
  late Animation<double> moverArriba;
  late Animation<double> moverIzquierda;
  late Animation<double> moverAbajo;

  @override
  void initState() {

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000)
    );

    moverDerecha = Tween(begin: 0.1, end: 150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.1,0.25, curve: Curves.bounceOut))
    );
    moverArriba = Tween(begin: 0.1, end: -150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.25,0.5, curve: Curves.bounceOut))
    );
    moverIzquierda = Tween(begin: 0.1, end: -150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.5,0.75, curve: Curves.bounceOut))
    );

    moverAbajo = Tween(begin: 0.1, end: 150.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: const Interval(0.75,1.0, curve: Curves.bounceOut))
    );

    controller.addListener(() {
      if(controller.status == AnimationStatus.completed){
        controller.repeat();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      child: const _Cuadrado(),
      builder: ((BuildContext context,Widget? child) {
        return Transform.translate(
          offset: Offset(moverDerecha.value + moverIzquierda.value,moverArriba.value + moverAbajo.value),
          child: child
        );
      }), 
    );
  }
}

class _Cuadrado extends StatelessWidget {
  const _Cuadrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.blue,
    );
  }
}