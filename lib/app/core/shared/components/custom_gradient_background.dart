import 'package:flutter/material.dart';

class CustomGradientBackground extends StatelessWidget {
  final List<Color> gradient;
  final Widget child;

  const CustomGradientBackground({
    Key? key,
    required this.gradient,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradient,
        ),
      ),
      child: child,
    );
  }
}
