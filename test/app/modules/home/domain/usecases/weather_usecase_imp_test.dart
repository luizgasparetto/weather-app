import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/core/shared/dtos/get_weather_dto.dart';
import 'package:weather_app/app/core/shared/errors/exceptions.dart';

import 'package:weather_app/app/core/shared/helpers/value_objects/place.dart';
import 'package:weather_app/app/modules/weather/domain/entities/forecast_entity.dart';
import 'package:weather_app/app/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/weather/domain/errors/domain_errors.dart';
import 'package:weather_app/app/modules/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_app/app/modules/weather/domain/usecases/get_current_weather/get_current_weather_usecase_imp.dart';
import 'package:weather_app/app/modules/weather/domain/usecases/get_current_weather/i_get_current_weather_usecase.dart';

class WeatherRepositoryMock extends Mock implements IWeatherRepository {}

void main() {
  late final IWeatherRepository weatherRepository;
  late final IGetCurrentWeatherUsecase sut;

  group('Weather Usecase | ', () {
    setUpAll(() {
      weatherRepository = WeatherRepositoryMock();
      sut = GetCurrentWeatherUsecaseImp(weatherRepository);
      registerFallbackValue(GetWeatherDTO(place: Place('Test Place')));
    });

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

    void mockErrorDataBuilder() {
      when(() => weatherRepository.getWeatherInfo(any())).thenAnswer(
        (_) async => Left(InvalidPlaceDomainError(message: 'Invalid place')),
      );
    }

    test('should be able to return a WeatherEntity when use correct params', () async {
      when(() => weatherRepository.getWeatherInfo(any())).thenAnswer((_) async => Right(response));

      final result = await sut(GetWeatherDTO(place: Place('Test Place')));

      expect(result.fold(id, id), isA<WeatherEntity>());
      expect(result.fold(id, id), equals(response));
    });

    test('should return a InvalidPlaceDomainError when use empty place\'s value', () async {
      mockErrorDataBuilder();

      final result = await sut(GetWeatherDTO(place: Place('')));

      expect(result.isLeft(), equals(true));
    });

    test('should return a InvalidPlaceDomainError when place\'s value length is less than 3', () async {
      mockErrorDataBuilder();

      final result = await sut(GetWeatherDTO(place: Place('xx')));

      expect(result.isLeft(), equals(true));
    });
  });
}
