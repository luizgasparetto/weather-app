import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/utils/either.dart';
import '../../infra/dtos/get_weather_dto.dart';
import '../entities/weather_entity.dart';

abstract class IWeatherUsecase {
  Future<Either<IAppException, WeatherEntity>> call(GetWeatherDTO params);
}
