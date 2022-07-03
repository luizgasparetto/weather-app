// ignore_for_file: unnecessary_lambdas

import 'package:dartz/dartz.dart';

import '../../../../core/shared/dtos/get_weather_dto.dart';
import '../../../../core/shared/errors/i_app_exception.dart';
import '../../domain/entities/weather_entity.dart';
import '../../domain/repositories/i_weather_repository.dart';
import '../datasources/i_weather_datasource.dart';

import '../errors/infra_exceptions.dart';
import '../mappers/weather_mapper.dart';

class WeatherRepositoryImp implements IWeatherRepository {
  final IWeatherDatasource _weatherDatasource;

  const WeatherRepositoryImp(IWeatherDatasource weatherDatasource) : _weatherDatasource = weatherDatasource;

  @override
  Future<Either<IAppException, WeatherEntity>> getWeatherInfo(GetWeatherDTO params) async {
    try {
      final response = await _weatherDatasource.getWeather(params);

      final weather = WeatherMapper.fromMap(response.data);

      return Right(weather);
    } on InfraWeatherException catch (e) {
      return Left(InfraWeatherRepositoryException(message: e.message, stackTrace: e.stackTrace));
    }
  }
}
