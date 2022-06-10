import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class CustomForecastCard extends StatelessWidget {
  const CustomForecastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.015),
      child: Container(
        width: size.width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Day 1',
                style: TextStyle(color: Theme.of(context).backgroundColor),
              ),
              SizedBox(height: size.height * 0.01),
              const Icon(
                WeatherIcons.day_sunny,
                size: 36,
                color: Colors.white,
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(left: size.width * 0.03),
                child: const Text(
                  '30 º',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(43, 43, 96, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
