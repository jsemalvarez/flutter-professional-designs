import 'package:flutter/material.dart';

// import 'package:designs/src/pages/headers_page.dart';
// import 'package:designs/src/pages/animaciones_page.dart';
// import 'package:designs/src/pages/practica_page.dart';
import 'package:designs/src/pages/circular_progress_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Designs App',
      home: CircularProgessPage(),
    );
  }
}