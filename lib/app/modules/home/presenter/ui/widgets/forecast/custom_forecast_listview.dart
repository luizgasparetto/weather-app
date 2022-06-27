import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../stores/weather/weather_bloc.dart';
import 'custom_forecast_card.dart';
import 'shimmer/shimmer_forecast_card.dart';

class CustomForecastListView extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const CustomForecastListView({Key? key, required this.weatherBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: size.height * 0.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (_, __) {
                    return BlocBuilder<WeatherBloc, WeatherState>(
                      bloc: weatherBloc,
                      builder: (_, state) {
                        if (state is WeatherLoadingState) {
                          return const ShimmerForecastCard();
                        } else if (state is WeatherLoadedState) {
                          return const CustomForecastCard();
                        }
                        // TODO - Make a better error handling
                        return const SizedBox.shrink();
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// return const CustomForecastCard();