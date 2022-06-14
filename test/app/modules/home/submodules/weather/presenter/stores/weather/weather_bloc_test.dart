import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/core/shared/exceptions/exceptions.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/dtos/get_weather_dto.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/entities/forecast_entity.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/usecases/i_weather_usecase.dart';
import 'package:weather_app/app/modules/home/submodules/weather/presenter/stores/weather/weather_bloc.dart';

class WeatherUsecaseMock extends Mock implements IWeatherUsecase {}

void main() {
  group('Weather Bloc | ', () {
    late final IWeatherUsecase weatherUsecase;

    final response = WeatherEntity(
      temperature: 'Test Temperature',
      wind: 'Test Wind',
      description: 'Test Description',
      forecasts: [
        ForecastEntity(
          day: 'Test Day',
          temperature: 'Test Temperature',
          wind: 'Test Wind',
        ),
      ],
    );

    setUpAll(() {
      weatherUsecase = WeatherUsecaseMock();
      registerFallbackValue(GetWeatherDTO(place: 'Test Place'));
    });

    blocTest<WeatherBloc, WeatherState>(
      'Loaded State',
      setUp: () {
        when(() => weatherUsecase(any())).thenAnswer((_) async => Right(response));
      },
      build: () => WeatherBloc(weatherUsecase),
      act: (bloc) => bloc.add(GetWeatherEvent(params: GetWeatherDTO(place: 'Test Place'))),
      expect: () => [WeatherLoadedState(weather: response)],
    );

    blocTest<WeatherBloc, WeatherState>(
      'Error State',
      setUp: () {
        when(() => weatherUsecase(any())).thenAnswer((_) async => Left(WeatherException(message: 'Weather Error')));
      },
      build: () => WeatherBloc(weatherUsecase),
      act: (bloc) => bloc.add(GetWeatherEvent(params: GetWeatherDTO(place: 'Test Place'))),
      expect: () => [WeatherErrorState()],
    );
  });
}
