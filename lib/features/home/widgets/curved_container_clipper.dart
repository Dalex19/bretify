import 'package:flutter/material.dart';

import 'dart:ui';

class CurvedContainerClipper extends CustomClipper<Path> {
  final double borderRadius;

  CurvedContainerClipper({this.borderRadius = 20.0});

  @override
  Path getClip(Size size) {
    Path path = Path();

    // ===========================
    // Curva Superior
    // ===========================

    // Mover al punto inicial (esquina superior izquierda)
    path.moveTo(0, borderRadius);

    // Curva superior izquierda
    path.quadraticBezierTo(
      0, 0, // Punto de control
      borderRadius, 0, // Punto final en la esquina superior izquierda
    );

    // Curva descendente en la parte superior
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.05, // Punto de control
      size.width * 0.5, size.height * 0.05, // Punto final en el centro
    );

    // Curva ascendente en la parte derecha
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.05, // Punto de control
      size.width - borderRadius,
      0, // Punto final en la esquina superior derecha
    );

    // Curva superior derecha
    path.quadraticBezierTo(
      size.width, 0, // Punto de control
      size.width, borderRadius, // Punto final en la esquina superior derecha
    );

    // ===========================
    // Curva Inferior (similar a la superior)
    // ===========================

    // Ir al punto inferior derecho
    path.lineTo(size.width, size.height - borderRadius);

    // Curva inferior derecha
    path.quadraticBezierTo(
      size.width, size.height, // Punto de control
      size.width - borderRadius,
      size.height, // Punto final en la esquina inferior derecha
    );

    // Curva ascendente en la parte inferior
    path.quadraticBezierTo(
      size.width * 0.75, size.height * 0.95, // Punto de control
      size.width * 0.5, size.height * 0.95, // Punto final en el centro
    );

    // Curva descendente en la parte izquierda
    path.quadraticBezierTo(
      size.width * 0.25, size.height * 0.95, // Punto de control
      borderRadius, size.height, // Punto final en la esquina inferior izquierda
    );

    // Curva inferior izquierda
    path.quadraticBezierTo(
      0, size.height, // Punto de control
      0,
      size.height -
          borderRadius, // Punto final en la esquina inferior izquierda
    );

    // Cerrar el camino de vuelta a la esquina superior izquierda
    path.lineTo(0, borderRadius); // Volver al borde izquierdo

    path.close(); // Cerrar el camino

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // No es necesario redibujar a menos que cambie algo
  }
}
