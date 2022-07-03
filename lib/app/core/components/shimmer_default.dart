import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDefault extends StatelessWidget {
  final double? width;
  final double? height;

  const ShimmerDefault({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200.withOpacity(0.5),
      highlightColor: Colors.white.withOpacity(0.7),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
