part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final GetWeatherDTO params;

  GetWeatherEvent({required this.params});
}
