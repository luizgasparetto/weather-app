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

  late String weatherImage;
  late List<Color> weatherGradient;

  void getWeatherInformations() {
    if (weather.description == 'Sunny') {
      weatherImage = 'assets/icons/sun.png';
      weatherGradient = CustomGradients.sunny;
    } else if (weather.description == 'Partly cloudy') {
      weatherImage = 'assets/icons/wind.png';
      weatherGradient = CustomGradients.wind;
    } else {
      weatherImage = 'assets/icons/rain.png';
      weatherGradient = CustomGradients.rain;
    }
  }

  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {}
