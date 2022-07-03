import '../../../../core/shared/dtos/get_weather_dto.dart';
import '../../../../core/shared/helpers/value_objects/place.dart';
import '../stores/weather/weather_bloc.dart';

class WeatherController {
  final WeatherBloc weatherBloc;

  WeatherController(this.weatherBloc);

  String? currentPlace;

  Future<void> handleGetWeather() async {
    if (!placeInstace.isValid) {
      place = 'Curitiba';
      currentPlace = 'Curitiba';
    }

    currentPlace = place;

    final params = GetWeatherDTO(
      place: Place(place),
    );

    weatherBloc.add(GetWeatherEvent(params: params));
  }

  final placeInstace = Place();
  String get place => placeInstace.value;
  set place(String newPlace) => placeInstace.value = newPlace;
}
