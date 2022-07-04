import 'package:flutter/material.dart';

import '../../../domain/entities/weather_entity.dart';

class CustomCurrentWeatherInfoWidget extends StatelessWidget {
  final String weatherImage;
  final WeatherEntity weather;

  const CustomCurrentWeatherInfoWidget({
    Key? key,
    required this.weatherImage,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: SizedBox(
          width: double.infinity,
          height: size.height * 0.6,
          child: Column(
            children: [
              SizedBox(
                width: size.width * 0.55,
                child: Image.asset(weatherImage),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.08),
                child: Text(
                  weather.temperature,
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              SizedBox(
                width: size.width * 0.35,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weather.description,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
