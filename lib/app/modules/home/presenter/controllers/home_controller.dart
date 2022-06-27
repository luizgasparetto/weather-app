import '../../../../core/shared/helpers/value_objects/place.dart';
import '../../domain/dtos/get_weather_dto.dart';
import '../stores/weather/weather_bloc.dart';

class HomeController {
  final WeatherBloc weatherBloc;

  HomeController(this.weatherBloc);

  Future<void> handleGetWeather([String placeName = 'Curitiba']) async {
    final params = GetWeatherDTO(
      place: Place(placeName),
    );

    weatherBloc.add(GetWeatherEvent(params: params));
  }
}
