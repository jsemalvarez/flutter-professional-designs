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

class HeaderDigonal extends StatelessWidget {
  const HeaderDigonal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color:const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderDiagonalPainter()
      ),
    );
  }
}

class _HeaderDiagonalPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    //propiedades
    paint.color = const Color(0xff615AAB);
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 25;
    paint.style = PaintingStyle.fill;

    //Dibujar con el lapiz y le path
    final path = Path();

    // el inicio del path es x=0 e y=0, pero podemos mover ese punto de inicio con moveTo
    path.moveTo(0, size.height * 0.35);
    path.lineTo(size.width, size.height * 0.30);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.lineTo(0, size.height * 0.35);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderDiagonalPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderDiagonalPainter oldDelegate) => false;
}


class HeaderTrinagular extends StatelessWidget {
  const HeaderTrinagular({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color:const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderTrinagularPainter()
      ),
    );
  }
}

class _HeaderTrinagularPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    //propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    //Dibujar con el lapiz y le path
    final path = Path();

    // path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderTrinagularPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderTrinagularPainter oldDelegate) => false;
}

class HeaderPico extends StatelessWidget {
  const HeaderPico({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color:const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderPicoPainter()
      ),
    );
  }
}

class _HeaderPicoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    //propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    //Dibujar con el lapiz y le path
    final path = Path();

    // path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.3);
    path.lineTo(size.width * 0.5, size.height * 0.33);
    path.lineTo(size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderPicoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderPicoPainter oldDelegate) => false;
}

class HeaderCurvo extends StatelessWidget {
  const HeaderCurvo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      // color:const Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderCurvoPainter()
      ),
    );
  }
}

class _HeaderCurvoPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {

    final paint = Paint();

    //propiedades
    paint.color = const Color(0xff615AAB);
    paint.style = PaintingStyle.fill;

    //Dibujar con el lapiz y le path
    final path = Path();

    // path.lineTo(0, size.height);
    path.lineTo(0, size.height * 0.3);
    // path.lineTo(size.width, size.height * 0.3);
    path.quadraticBezierTo(size.width * 0.5, size.height * 0.36, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderCurvoPainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(_HeaderCurvoPainter oldDelegate) => false;
}