import '../../domain/entities/forecast_entity.dart';

class ForecastMapper extends ForecastEntity {
  ForecastMapper({
    required super.day,
    required super.temperature,
    required super.wind,
  });

  factory ForecastMapper.fromMap(Map<String, dynamic> map) {
    return ForecastMapper(
      day: map['day'],
      temperature: map['temperature'],
      wind: map['wind'],
    );
  }
}
