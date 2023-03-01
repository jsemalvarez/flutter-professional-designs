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
        child: Text('$porcentaje %', style: const TextStyle(fontSize: 50.0),)
      ),
    );
  }
}