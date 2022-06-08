import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/utils/either.dart';
import '../../infra/dtos/get_weather_dto.dart';
import '../entities/weather_entity.dart';
import '../repositories/i_weather_repository.dart';
import 'i_weather_usecase.dart';

class WeatherUsecaseImp implements IWeatherUsecase {
  final IWeatherRepository _weatherRepository;

  const WeatherUsecaseImp(IWeatherRepository weatherRepository) : _weatherRepository = weatherRepository;

  @override
  Future<Either<IAppException, WeatherEntity>> getWeather(GetWeatherDTO params) async {
    return await _weatherRepository.getWeather(params);
  }
}
