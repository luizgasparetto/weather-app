import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/core/shared/dtos/get_weather_dto.dart';
import 'package:weather_app/app/core/shared/helpers/value_objects/place.dart';
import 'package:weather_app/app/modules/weather/domain/entities/forecast_entity.dart';
import 'package:weather_app/app/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/weather/domain/errors/domain_errors.dart';
import 'package:weather_app/app/modules/weather/domain/usecases/get_current_weather/i_get_current_weather_usecase.dart';
import 'package:weather_app/app/modules/weather/presenter/stores/weather/weather_bloc.dart';

class GetCurrentWeatherUsecaseMock extends Mock implements IGetCurrentWeatherUsecase {}

void main() {
  group('Weather Bloc | ', () {
    late final IGetCurrentWeatherUsecase weatherUsecase;
    late final Place defaultPlace;

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
      weatherUsecase = GetCurrentWeatherUsecaseMock();
      defaultPlace = Place('Test Place');
      registerFallbackValue(GetWeatherDTO(place: defaultPlace));
    });

    blocTest<WeatherBloc, WeatherState>(
      'Loaded State',
      setUp: () {
        when(() => weatherUsecase(any())).thenAnswer((_) async => Right(response));
      },
      build: () => WeatherBloc(weatherUsecase),
      act: (bloc) => bloc.add(GetWeatherEvent(params: GetWeatherDTO(place: defaultPlace))),
      expect: () => [WeatherLoadedState(weather: response)],
    );

    blocTest<WeatherBloc, WeatherState>(
      'Error State',
      setUp: () {
        when(() => weatherUsecase(any())).thenAnswer((_) async => Left(DomainWeatherErrors(message: 'Weather Error')));
      },
      build: () => WeatherBloc(weatherUsecase),
      act: (bloc) => bloc.add(GetWeatherEvent(params: GetWeatherDTO(place: defaultPlace))),
      expect: () => [WeatherErrorState()],
    );
  });
}
