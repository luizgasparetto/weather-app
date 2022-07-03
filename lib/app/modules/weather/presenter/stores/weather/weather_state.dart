// ignore_for_file: must_be_immutable

part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weather;

  WeatherLoadedState({required this.weather}) {
    getWeatherInformations();
  }

  void getWeatherInformations() {
    if (weather.description == 'Sunny') {
      weather.image = 'assets/icons/sun.png';
      weather.colorGradient = CustomGradients.sunny;
    } else if (weather.description == 'Partly cloudy') {
      weather.image = 'assets/icons/wind.png';
      weather.colorGradient = CustomGradients.wind;
    } else {
      weather.image = 'assets/icons/rain.png';
      weather.colorGradient = CustomGradients.rain;
    }
  }

  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {}
