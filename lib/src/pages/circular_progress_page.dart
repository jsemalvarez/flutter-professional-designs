import 'package:flutter/material.dart';

class CircularProgessPage extends StatefulWidget {
  const CircularProgessPage({super.key});

  @override
  State<CircularProgessPage> createState() => _CircularProgessPageState();
}

class _CircularProgessPageState extends State<CircularProgessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.red,
        )
      ),
    );
  }
}