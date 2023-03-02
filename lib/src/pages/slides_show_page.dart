import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';


class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/svgs/slide-4.svg'),
      ),
    );
  }
}