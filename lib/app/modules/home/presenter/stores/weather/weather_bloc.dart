// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../domain/dtos/get_weather_dto.dart';
import '../../../domain/entities/weather_entity.dart';
import '../../../domain/usecases/get_weather/i_get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IGetWeatherUsecase _weatherUsecase;

  WeatherBloc(IGetWeatherUsecase weatherUsecase)
      : _weatherUsecase = weatherUsecase,
        super(WeatherLoadingState()) {
    //
    on<GetWeatherEvent>((event, emit) async {
      final result = await _weatherUsecase(event.params);

      result.fold(
        (left) {
          emit(WeatherErrorState());
        },
        (right) {
          emit(WeatherLoadedState(weather: right));
        },
      );
    });
  }
}
