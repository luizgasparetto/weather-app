import 'package:flutter/material.dart';

import '../shimmer_default.dart';

class ShimmerInfoContent extends StatelessWidget {
  const ShimmerInfoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            ShimmerDefault(
              width: size.width * 0.8,
              height: size.height * 0.4,
            ),
            SizedBox(height: size.height * 0.03),
            ShimmerDefault(
              width: size.width * 0.6,
              height: size.height * 0.055,
            ),
            SizedBox(height: size.height * 0.01),
            ShimmerDefault(
              width: size.width * 0.5,
              height: size.height * 0.025,
            ),
          ],
        ),
      ),
    );
  }
}
