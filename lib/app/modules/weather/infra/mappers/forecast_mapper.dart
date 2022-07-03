import '../../domain/entities/forecast_entity.dart';
import '../errors/forecast_mapper_exception.dart';
import '../errors/infra_exceptions.dart';

class ForecastMapper extends ForecastEntity {
  ForecastMapper({
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
    } on InfraWeatherException catch (e) {
      throw ForecastMapperException(message: e.message, stackTrace: e.stackTrace);
    }
  }
}
