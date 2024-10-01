// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bretify_mvp/features/home/cubit/cubit_indicator.dart';
import 'package:bretify_mvp/features/home/widgets/traingle.dart';

//Este es el widget que tendra un estado BlocProvider
class CustomMarker extends StatelessWidget {
  const CustomMarker({super.key, required this.showAlways, required this.imgPath});
  final bool showAlways;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitIndicator, bool>(builder: (context, state) {
      bool shouldShowSecondMarker = showAlways || state;
      return Column(
        children: [
          AnimatedOpacity(
            opacity: shouldShowSecondMarker ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: shouldShowSecondMarker
                ?  CustomMarkerSecond(imgPath: imgPath,)
                : const SizedBox(),
          ),
          const CircleAvatar(
            minRadius: 15,
            maxRadius: 15,
            backgroundColor: Colors.black,
            child: Icon(
              Icons.location_on_outlined,
              size: 20,
              color: Colors.white,
            ),
          )
        ],
      );
    });
  }
}

class CustomMarkerSecond extends StatelessWidget {
  const CustomMarkerSecond({
    super.key,
    required this.imgPath,
  });
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: const Alignment(0, -0.9),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    imgPath, // Aquí tu imagen personalizada
                  ),
                  fit: BoxFit.cover,
                ),
                color: Colors.white, // Fondo blanco
                borderRadius: BorderRadius.circular(10), // Bordes redondeados
                border: Border.all(
                  color: Colors.black,
                  width: 2, // Borde negro
                ),
              ),
            ),
          ),
          // Triángulo invertido
          Positioned(
            bottom: 0,
            child: CustomPaint(
              size: const Size(20, 15),
              painter: TrianglePainter(),
            ),
          ),
        ],
      ),
    );
  }
}
