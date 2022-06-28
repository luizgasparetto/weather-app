import 'package:flutter/material.dart';

import '../../../../domain/entities/weather_entity.dart';

class CustomInfoContent extends StatelessWidget {
  final String weatherImage;
  final WeatherEntity weather;

  const CustomInfoContent({
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
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: size.width * 0.65,
                child: Image.asset(weatherImage),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.08),
              child: Text(
                weather.temperature,
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            SizedBox(
              width: size.width * 0.25,
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
          ],
        ),
      ),
    );
  }
}
