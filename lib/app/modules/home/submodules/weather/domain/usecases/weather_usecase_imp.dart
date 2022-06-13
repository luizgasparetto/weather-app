import 'package:dartz/dartz.dart';

import '../../../../../../core/shared/exceptions/exceptions.dart';
import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../dtos/get_weather_dto.dart';
import '../entities/weather_entity.dart';
import '../repositories/i_weather_repository.dart';
import 'i_weather_usecase.dart';

class WeatherUsecaseImp implements IWeatherUsecase {
  final IWeatherRepository _weatherRepository;

  const WeatherUsecaseImp(IWeatherRepository weatherRepository) : _weatherRepository = weatherRepository;

  @override
  Future<Either<IAppException, WeatherEntity>> call(GetWeatherDTO params) async {
    if (params.place.isEmpty || params.place.length < 3) {
      throw WeatherException(message: 'Invalid place');
      //return Left(WeatherException(message: 'Invalid place'));
    }

    return await _weatherRepository.getWeather(params);
  }
}
