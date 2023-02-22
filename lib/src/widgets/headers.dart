import 'package:flutter/material.dart';

class HeaderCudrado extends StatelessWidget {
  const HeaderCudrado({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color:const Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  const HeaderBordesRedondeados({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: const BoxDecoration(
        color:Color(0xff615AAB),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(70),
          bottomRight: Radius.circular(70),
        )
      ),
    );
  }
}