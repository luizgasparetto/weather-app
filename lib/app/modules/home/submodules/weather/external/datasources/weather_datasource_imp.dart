import '../../../../../../core/shared/services/clients/i_client_service.dart';

import '../../infra/datasources/i_weather_datasource.dart';
import '../../infra/dtos/get_weather_dto.dart';

class WeatherDatasourceImp implements IWeatherDatasource {
  final IClientService _clientService;

  const WeatherDatasourceImp(IClientService clientService) : _clientService = clientService;

  @override
  Future<ResponseService> getWeather(GetWeatherDTO params) async {
    // TODO - Implement API's url
    return await _clientService.get('https://goweather.herokuapp.com/weather/${params.place}');
  }
}
