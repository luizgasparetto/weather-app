import 'package:flutter/material.dart';

import '../../../domain/entities/forecast_entity.dart';
import 'custom_forecast_card.dart';

class CustomForecastListViewWidget extends StatelessWidget {
  final List<ForecastEntity> forecasts;

  const CustomForecastListViewWidget({Key? key, required this.forecasts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Column(
        children: [
          SizedBox(height: size.height * 0.05),
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: size.height * 0.21,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: forecasts.length,
                      itemBuilder: (_, i) {
                        return CustomForecastCard(
                          day: forecasts[i].day,
                          temperature: forecasts[i].temperature,
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
