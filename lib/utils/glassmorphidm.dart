import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer(
      {super.key,
      required this.height,
      required this.width,
      this.child,
      required this.borderRadius,
      required this.border,
      required this.blur,
      required this.colors});
  final double height;
  final double width;
  final double borderRadius;
  final double border;
  final double blur;
  final List<Color> colors;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: width,
      height: height,
      borderRadius: borderRadius,
      blur: blur,
      alignment: Alignment.bottomCenter,
      border: border,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
        stops: [
          0.1,
          1,
        ],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      ),
      child: child,
    );
  }
}
