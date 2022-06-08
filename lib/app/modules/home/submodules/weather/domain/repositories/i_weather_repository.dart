import '../dtos/get_weather_dto.dart';
import '../entities/weather_entity.dart';

abstract class IWeatherRepository {
  Future<List<WeatherEntity>> getWeather(GetWeatherDTO params);
}
