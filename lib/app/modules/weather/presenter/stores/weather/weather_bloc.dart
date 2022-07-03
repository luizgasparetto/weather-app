// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/dtos/get_weather_dto.dart';
import '../../../../../core/themes/custom_gradients.dart';

import '../../../domain/entities/weather_entity.dart';
import '../../../domain/usecases/get_current_weather/i_get_current_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IGetCurrentWeatherUsecase _getCurrentWeatherUsecase;

  WeatherBloc(IGetCurrentWeatherUsecase getCurrentWeatherUsecase)
      : _getCurrentWeatherUsecase = getCurrentWeatherUsecase,
        super(
          WeatherLoadingState(),
        ) {
    //
    on<GetWeatherEvent>((event, emit) async {
      final result = await _getCurrentWeatherUsecase(event.params);

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
