import '../../../../core/shared/services/clients/i_client_service.dart';

import '../../domain/dtos/get_weather_dto.dart';
import '../../infra/datasources/i_weather_datasource.dart';
import '../errors/datasource_errors.dart';

class WeatherDatasourceImp implements IWeatherDatasource {
  final IClientService _clientService;

  const WeatherDatasourceImp(IClientService clientService) : _clientService = clientService;

  @override
  Future<ResponseService> getWeather(GetWeatherDTO params) async {
    try {
      const apiUrl = String.fromEnvironment('api_url');

      return await _clientService.get('$apiUrl/${params.place.value.toLowerCase()}');
    } on DatasourceWeatherErrors catch (e) {
      throw DatasourceLoadedError(message: e.message, stackTrace: e.stackTrace);
    }
  }
}
