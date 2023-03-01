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
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.red,
          child: RadialProgress( porcentaje: 40),
        ),
        // child: Text('$porcentaje %', style: const TextStyle(fontSize: 50.0),)
      ),
    );
  }
}