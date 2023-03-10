import 'package:flutter/material.dart';
import 'package:designs/src/widgets/slideshow.dart';

import 'package:flutter_svg/svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Expanded(child: OneSlideshow()),
          Expanded(child: OneSlideshow()),
        ],
      )
    );
  }
}

class OneSlideshow extends StatelessWidget {
  const OneSlideshow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      puntosArriba: true,
      colorPrimario: Colors.red,
      colorSecundario: Colors.black54,
      bulletPrimario: 25,
      bulletSecundario: 12,
      slides: [
        SvgPicture.asset('assets/svgs/slide-1.svg'),
        SvgPicture.asset('assets/svgs/slide-2.svg'),
        SvgPicture.asset('assets/svgs/slide-3.svg'),
        SvgPicture.asset('assets/svgs/slide-4.svg'),
        SvgPicture.asset('assets/svgs/slide-5.svg'),
      ],
    );
  }
}