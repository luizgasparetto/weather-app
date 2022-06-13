import 'package:flutter/material.dart';

import 'custom_forecast_card.dart';

class CustomForecastListView extends StatelessWidget {
  const CustomForecastListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Expanded(
        child: SizedBox(
          height: size.height * 0.25,
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (_, __) {
                return const CustomForecastCard();
              },
            ),
          ),
        ),
      ),
    );
  }
}
