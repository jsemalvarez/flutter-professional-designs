import 'package:flutter/material.dart';

class PinteresButtom {
  final Function onPressed;
  final IconData icon;

  PinteresButtom({required this.onPressed, required this.icon});
}

class PinteresMenu extends StatelessWidget {
  final List<PinteresButtom> items = [
    PinteresButtom(onPressed: (){print('pie_chart');}, icon: Icons.pie_chart),
    PinteresButtom(onPressed: (){print('search');}, icon: Icons.search),
    PinteresButtom(onPressed: (){print('notifications');}, icon: Icons.notifications),
    PinteresButtom(onPressed: (){print('supervised_user_circle');}, icon: Icons.supervised_user_circle),
  ];

  PinteresMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: const Text('Hola mundo desde el menu'),
      ),
    );
  }
}
