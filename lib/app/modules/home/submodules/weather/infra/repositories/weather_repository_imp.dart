// ignore_for_file: unnecessary_lambdas

import '../../../../../../core/shared/exceptions/client_exception.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/utils/either.dart';

import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_weather_repository.dart';
import '../datasources/i_weather_datasource.dart';
import '../dtos/get_weather_dto.dart';
import '../mappers/weather_mapper.dart';

class WeatherRepositoryImp implements IWeatherRepository {
  final IWeatherDatasource _weatherDatasource;

  const WeatherRepositoryImp(IWeatherDatasource weatherDatasource) : _weatherDatasource = weatherDatasource;

  @override
  Future<Either<IAppException, WeatherEntity>> getWeather(GetWeatherDTO params) async {
    try {
      final response = await _weatherDatasource.getWeather(params);

      final data = response.data;

      final weather = WeatherMapper.fromMap(data);

      return right(weather);
    } on IAppException catch (error, stacktrace) {
      throw ClientException(message: error.message, stackTrace: stacktrace);
    }
  }
}
