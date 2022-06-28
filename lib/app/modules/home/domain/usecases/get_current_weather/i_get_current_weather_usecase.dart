import 'package:dartz/dartz.dart';

import '../../../../../core/shared/dtos/get_weather_dto.dart';
import '../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../entities/weather_entity.dart';

abstract class IGetCurrentWeatherUsecase {
  Future<Either<IAppException, WeatherEntity>> call(GetWeatherDTO params);
}
