import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class SlidesShowPage extends StatelessWidget {
  const SlidesShowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _Slides(),
      ),
    );
  }
}

class _Slides extends StatelessWidget {
  const _Slides({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      child: PageView( 
        children: const [
          _Slide(svg:'assets/svgs/slide-1.svg'),
          _Slide(svg:'assets/svgs/slide-2.svg'),
          _Slide(svg:'assets/svgs/slide-3.svg'),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final String svg;

  const _Slide({
    Key? key, 
    required this.svg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      child: SvgPicture.asset(svg)
    );
  }
}
