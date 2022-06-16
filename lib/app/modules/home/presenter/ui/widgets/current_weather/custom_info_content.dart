import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../stores/weather/weather_bloc.dart';
import 'shimmer/shimmer_current_weather_image.dart';
import 'shimmer/shimmer_weather_details_info.dart';

class CustomInfoContent extends StatelessWidget {
  final WeatherBloc weatherBloc;

  const CustomInfoContent({Key? key, required this.weatherBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
        child: BlocBuilder<WeatherBloc, WeatherState>(
          bloc: weatherBloc,
          builder: (_, state) {
            if (state is WeatherLoadingState) {
              return Column(
                children: [
                  const Center(
                    child: ShimmerCurrentWeatherImage(),
                  ),
                  SizedBox(height: size.height * 0.03),
                  const Center(
                    child: ShimmerWeatherDetailsInfo(),
                  ),
                ],
              );
            } else if (state is WeatherLoadedState) {
              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: size.width * 0.65,
                      child: Image.asset('assets/icons/rain.png'),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.08),
                    child: Text(
                      '16 º',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.wind_power_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const Spacer(),
                        const Text('10 km/h'),
                      ],
                    ),
                  ),
                ],
              );
            }
            // TODO - Create an error state better, with custom widgets and images
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
