import '../../../../../../core/shared/services/clients/i_client_service.dart';
import '../dtos/get_weather_dto.dart';

abstract class IWeatherDatasource {
  Future<ResponseService> getWeather(GetWeatherDTO params);
}
