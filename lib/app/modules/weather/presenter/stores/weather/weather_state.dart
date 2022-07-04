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

  late final String image;
  late final List<Color> gradient;

  void getWeatherInformations() {
    if (weather.description == 'Sunny') {
      image = 'assets/icons/sun.png';
      gradient = CustomGradients.sunny;
    } else if (weather.description == 'Partly cloudy') {
      image = 'assets/icons/wind.png';
      gradient = CustomGradients.wind;
    } else {
      image = 'assets/icons/rain.png';
      gradient = CustomGradients.rain;
    }
  }

  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {}
