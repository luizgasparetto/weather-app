import 'package:flutter/cupertino.dart';

import 'forecast_entity.dart';

class WeatherEntity {
  final String temperature;
  final String wind;
  final String description;
  final List<ForecastEntity> forecasts;
  String? image;
  List<Color>? colorGradient;

  WeatherEntity({
    required this.temperature,
    required this.wind,
    required this.description,
    required this.forecasts,
    this.image,
    this.colorGradient,
  });
}
