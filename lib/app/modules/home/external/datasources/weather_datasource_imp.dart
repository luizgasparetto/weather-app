import '../../../../core/shared/services/clients/i_client_service.dart';
import '../../domain/dtos/get_weather_dto.dart';
import '../../infra/datasources/i_weather_datasource.dart';

class WeatherDatasourceImp implements IWeatherDatasource {
  final IClientService _clientService;

  const WeatherDatasourceImp(IClientService clientService) : _clientService = clientService;

  @override
  Future<ResponseService> getWeather(GetWeatherDTO params) async {
    const apiUrl = String.fromEnvironment('api_url');

    return await _clientService.get('$apiUrl/${params.place}');
  }
}
