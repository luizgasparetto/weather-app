import '../../../../core/shared/helpers/value_objects/place.dart';
import '../../../../core/shared/services/database/i_database_service.dart';
import '../../domain/dtos/get_weather_dto.dart';
import '../stores/weather/weather_bloc.dart';

class HomeController {
  final WeatherBloc weatherBloc;
  final IDatabaseService _prefsService;

  HomeController(this.weatherBloc, IDatabaseService prefsService) : _prefsService = prefsService;

  Future<Place> get currentPlace async => _prefsService.getPlace();

  Future<void> setCurrentPlace(GetWeatherDTO params) async {
    await _prefsService.setPlace(params);
  }

  Future<void> handleGetPlace() async {
    final place = await currentPlace;

    weatherBloc.add(GetWeatherEvent(params: GetWeatherDTO(place: place)));
  }
}
