import '../../../../core/shared/dtos/get_weather_dto.dart';
import '../../../../core/shared/services/clients/i_client_service.dart';

abstract class IWeatherDatasource {
  Future<ResponseService> getWeather(GetWeatherDTO params);
}
