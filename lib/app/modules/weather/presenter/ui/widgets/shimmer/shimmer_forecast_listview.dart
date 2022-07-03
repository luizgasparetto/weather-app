import 'package:flutter/material.dart';

import '../../../../../../core/components/shimmer_default.dart';

class ShimmerForecastListView extends StatelessWidget {
  const ShimmerForecastListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.13),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: size.height * 0.17,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (_, __) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
                          child: ShimmerDefault(
                            width: size.width * 0.3,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
