import 'package:flutter/material.dart';

class VideoBackground extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  const VideoBackground(
      {super.key,
        this.colors = const [Colors.transparent, Colors.black87],
        this.stops = const [0.5, 1]
      }): assert(colors.length == stops.length, 'Las listas de colores y de stops deben tener la misma longitud');

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: DecoratedBox(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors,
              stops: stops,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    ));
  }
}
