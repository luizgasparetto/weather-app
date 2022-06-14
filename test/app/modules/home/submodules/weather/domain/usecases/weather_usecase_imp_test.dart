import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/app/core/shared/exceptions/exceptions.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/dtos/get_weather_dto.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/entities/forecast_entity.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/usecases/i_weather_usecase.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/usecases/weather_usecase_imp.dart';

class WeatherRepositoryMock extends Mock implements IWeatherRepository {}

void main() {
  late final IWeatherRepository weatherRepository;
  late final IWeatherUsecase sut;

  group('Weather usecase | ', () {
    setUpAll(() {
      weatherRepository = WeatherRepositoryMock();
      sut = WeatherUsecaseImp(weatherRepository);
      registerFallbackValue(GetWeatherDTO(place: 'Test Place'));
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
      when(() => weatherRepository.getWeather(any())).thenAnswer(
        (_) async => Left(WeatherException(message: 'Weather Error')),
      );
    }

    test('should be able to return a WeatherEntity when use correct params', () async {
      when(() => weatherRepository.getWeather(any())).thenAnswer((_) async => Right(response));

      final result = await sut(GetWeatherDTO(place: 'Curitiba'));

      expect(result.fold(id, id), isA<WeatherEntity>());
      expect(result.fold(id, id), equals(response));
    });

    test('should throw an WeatherException when use empty params', () async {
      mockErrorDataBuilder();

      final result = sut(GetWeatherDTO(place: ''));

      expect(result.then((value) => value.fold(id, id)), throwsA(isA<WeatherException>()));
    });

    test('should throw an WeatherException when params length is less than 3', () async {
      mockErrorDataBuilder();

      final result = sut(GetWeatherDTO(place: 'xx'));

      expect(result.then((value) => value.fold(id, id)), throwsA(isA<WeatherException>()));
    });
  });
}
