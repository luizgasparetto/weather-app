// ignore_for_file: unnecessary_lambdas

import '../../domain/dtos/get_weather_dto.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_weather_repository.dart';
import '../datasources/i_weather_datasource.dart';
import '../mappers/weather_mapper.dart';

class WeatherRepositoryImp implements IWeatherRepository {
  final IWeatherDatasource _weatherDatasource;

  const WeatherRepositoryImp(IWeatherDatasource weatherDatasource) : _weatherDatasource = weatherDatasource;

  @override
  Future<List<WeatherEntity>> getWeather(GetWeatherDTO params) async {
    final response = await _weatherDatasource.getWeather(params);

    final dataList = response.data as List;

    return dataList.map((weather) => WeatherMapper.fromMap(weather)).toList();
  }
}
