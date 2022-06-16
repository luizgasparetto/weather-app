// ignore_for_file: unnecessary_lambdas

import '../../domain/entities/forecast_entity.dart';
import '../../domain/entities/weather_entity.dart';
import 'forecast_mapper.dart';

class WeatherMapper extends WeatherEntity {
  WeatherMapper({
    required super.temperature,
    required super.wind,
    required super.description,
    required super.forecasts,
  });

  factory WeatherMapper.fromMap(Map<String, dynamic> map) {
    return WeatherMapper(
      temperature: map['temperature'] ?? '',
      wind: map['wind'] ?? '',
      description: map['description'] ?? '',
      forecasts: List<ForecastEntity>.from(map['forecast']?.map((e) => ForecastMapper.fromMap(e))),
    );
  }
}
