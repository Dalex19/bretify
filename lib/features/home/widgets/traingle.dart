import 'package:flutter/material.dart';

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    Paint painter = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.square
      ..strokeWidth = 2;

    Path path = Path()
      // Moverse al centro superior del triángulo
      ..moveTo(width / 2, height)
      // Línea desde el centro superior a la esquina inferior izquierda
      ..lineTo(0, 0)
      // Línea desde la esquina inferior izquierda a la esquina inferior derecha
      ..lineTo(width, 0)
      // Cierra el triángulo de vuelta al centro superior
      ..close();

    canvas.drawPath(path, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
