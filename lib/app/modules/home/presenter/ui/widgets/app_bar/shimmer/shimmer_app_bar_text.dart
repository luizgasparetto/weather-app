import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAppBarText extends StatelessWidget {
  const ShimmerAppBarText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade200.withOpacity(0.5),
      highlightColor: Colors.white.withOpacity(0.7),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
