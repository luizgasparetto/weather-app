part of 'weather_bloc.dart';

@immutable
abstract class WeatherState extends Equatable {
  @override
  List<Object?> get props => [];
}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherEntity weather;

  WeatherLoadedState({required this.weather});

  @override
  List<Object?> get props => [weather];
}

class WeatherErrorState extends WeatherState {}
