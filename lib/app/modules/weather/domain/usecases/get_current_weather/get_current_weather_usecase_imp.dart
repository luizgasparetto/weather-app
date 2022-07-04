import 'package:dartz/dartz.dart';

import '../../../../../core/shared/errors/i_app_exception.dart';
import '../../dtos/get_weather_dto.dart';
import '../../entities/weather_entity.dart';
import '../../errors/domain_errors.dart';
import '../../repositories/i_weather_repository.dart';
import 'i_get_current_weather_usecase.dart';

class GetCurrentWeatherUsecaseImp implements IGetCurrentWeatherUsecase {
  final IWeatherRepository _weatherRepository;

  const GetCurrentWeatherUsecaseImp(IWeatherRepository weatherRepository) : _weatherRepository = weatherRepository;

  @override
  Future<Either<IAppException, WeatherEntity>> call(GetWeatherDTO params) async {
    if (!params.place.isValid) {
      return Left(InvalidPlaceDomainError(message: 'Invalid place'));
    }

    return await _weatherRepository.getWeatherInfo(params);
  }
}
