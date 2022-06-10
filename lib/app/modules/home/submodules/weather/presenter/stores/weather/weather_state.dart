part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weather;

  WeatherLoadedState({required this.weather});
}

class WeatherErrorState extends WeatherState {}
