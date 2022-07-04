import '../../domain/entities/forecast_entity.dart';
import '../errors/infra_errors.dart';

class ForecastMapper extends ForecastEntity {
  const ForecastMapper({
    required super.day,
    required super.temperature,
    required super.wind,
  });

  factory ForecastMapper.fromMap(Map<String, dynamic> map) {
    try {
      return ForecastMapper(
        day: map['day'],
        temperature: map['temperature'],
        wind: map['wind'],
      );
    } on InfraWeatherError catch (e) {
      throw ForecastMapperException(message: e.message, stackTrace: e.stackTrace);
    }
  }
}
