import 'package:flutter/material.dart';

class CustomForecastCard extends StatelessWidget {
  final String day;
  final String temperature;

  const CustomForecastCard({
    Key? key,
    required this.day,
    required this.temperature,
  }) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Day $day',
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                temperature,
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
