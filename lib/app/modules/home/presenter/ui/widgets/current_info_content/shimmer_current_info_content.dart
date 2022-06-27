import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerInfoContent extends StatelessWidget {
  const ShimmerInfoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
        child: Column(
          children: [
            Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200.withOpacity(0.5),
                highlightColor: Colors.white.withOpacity(0.7),
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.4,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade200.withOpacity(0.5),
                highlightColor: Colors.white.withOpacity(0.7),
                child: Container(
                  width: size.width * 0.6,
                  height: size.height * 0.09,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
