import 'package:flutter/cupertino.dart';

import '../../../../core/shared/helpers/value_objects/place.dart';
import '../../domain/dtos/get_weather_dto.dart';
import '../stores/weather/weather_bloc.dart';

class WeatherController {
  final WeatherBloc weatherBloc;
  final formKey = GlobalKey<FormState>();
  String? currentPlace;

  WeatherController(this.weatherBloc);

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

    placeInstace.clear();
  }

  final placeInstace = Place();
  String get place => placeInstace.value;
  set place(String newPlace) => placeInstace.value = newPlace;
}
