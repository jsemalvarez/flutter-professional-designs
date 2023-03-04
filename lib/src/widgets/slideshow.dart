import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:designs/src/models/slider_model.dart';

import 'package:flutter_svg/svg.dart';


class Slideshow extends StatelessWidget {

  final List<Widget> slides;

  const Slideshow({
    super.key, 
    required this.slides
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SliderModel(),
      child: Center(
          child: Column(
            children: [
              Expanded(
                child: _Slides(slides: slides,)
              ),
              _Dots(tatalsDots: slides.length),
            ],
          ),
        ),
    );
  }
}


class _Slides extends StatefulWidget {

  final List<Widget> slides;
  const _Slides({
    super.key, 
    required this.slides
  });

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {

  final pageViewController = PageController();

@override
  void initState() {
    super.initState();
    
    pageViewController.addListener(() {
      
      // print('pagina actual: ${pageViewController.page}');
      // Actualizar el provider, sliderModel
      Provider.of<SliderModel>(context, listen: false).currentPage = pageViewController.page!;

    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      child: PageView( 
        controller: pageViewController,
        // children: const [
        //   _Slide(svg:'assets/svgs/slide-1.svg'),
        //   _Slide(svg:'assets/svgs/slide-2.svg'),
        //   _Slide(svg:'assets/svgs/slide-3.svg'),
        // ],
        children: widget.slides.map((slide) => _Slide(svg: slide,)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  // final String svg;
  final Widget svg;

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
      // child: SvgPicture.asset(svg)
      child: svg
    );
  }
}


class _Dots extends StatelessWidget {
  final tatalsDots;
  const _Dots({
    super.key, 
    this.tatalsDots
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      // color: Colors.red,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(tatalsDots, (index) => _Dot(index: index)),
        // children: const [
        //   _Dot(index: 0),
        //   _Dot(index: 1),
        //   _Dot(index: 2),
        // ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {

  final int index;
  
  const _Dot({
    Key? key, 
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      duration:const Duration(milliseconds: 200),
      height: 15,
      width: 15,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: (pageViewIndex >= (index - 0.5 ) && pageViewIndex < (index + 0.5 )) ? Colors.blue : Colors.grey,
        shape: BoxShape.circle
      ), 
    );
  }
}

