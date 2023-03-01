import 'package:designs/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({super.key});

  @override
  State<GraficasCircularesPage> createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          porcentaje += 10;
          if( porcentaje > 100){
            porcentaje = 0;
          }
          setState(() {});
        },
        child: const Icon( Icons.refresh ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomRadialProgress(porcentaje: porcentaje),
              CustomRadialProgress(
                porcentaje: porcentaje, 
                colorPrimario: Colors.pink,
                grosorSecundario: 20,
              ),
            ],
          ),
          Row( 
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               CustomRadialProgress(
                porcentaje: porcentaje, 
                colorPrimario: Colors.purple,
                colorSecundario: Colors.orange,
                grosorPrimario: 10,
                grosorSecundario: 10,
              ),
              CustomRadialProgress(
                porcentaje: porcentaje,
                colorPrimario: Colors.green,
                colorSecundario: Colors.lightBlue,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorPrimario;
  final double grosorSecundario;


  const CustomRadialProgress({
    Key? key,
    required this.porcentaje, 
    this.colorPrimario = Colors.blue,
    this.colorSecundario = Colors.grey,
    this.grosorPrimario = 10,
    this.grosorSecundario = 4,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(10),
      // color: Colors.red,
      child: RadialProgress( 
        porcentaje: porcentaje,
        colorPrimario: colorPrimario,
        colorSecundario: colorSecundario,
        grosorPrimario: grosorPrimario,
        grosorSecundario: grosorSecundario,
      ),
    );
  }
}