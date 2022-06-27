import 'package:dartz/dartz.dart';

import '../../../../../core/shared/exceptions/exceptions.dart';
import '../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../dtos/get_weather_dto.dart';
import '../../entities/weather_entity.dart';
import '../../repositories/i_weather_repository.dart';
import 'i_get_weather_usecase.dart';

class GetWeatherUsecaseImp implements IGetWeatherUsecase {
  final IWeatherRepository _weatherRepository;

  const GetWeatherUsecaseImp(IWeatherRepository weatherRepository) : _weatherRepository = weatherRepository;

  @override
  Future<Either<IAppException, WeatherEntity>> call(GetWeatherDTO params) async {
    // TODO -  Refactor: Return left error and fix the tests.
    if (!params.place.isValid) {
      throw WeatherException(message: 'Invalid place');
    }

    return await _weatherRepository.getWeatherInfo(params);
  }
}
