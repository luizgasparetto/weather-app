import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/app/core/shared/services/clients/dio_client_imp.dart';
import 'package:weather_app/app/core/shared/services/clients/i_client_service.dart';
import 'package:weather_app/app/modules/home/domain/dtos/get_weather_dto.dart';
import 'package:weather_app/app/modules/home/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/home/domain/repositories/i_weather_repository.dart';
import 'package:weather_app/app/modules/home/infra/datasources/i_weather_datasource.dart';
import 'package:weather_app/app/modules/home/infra/repositories/weather_repository_imp.dart';

import '../../../../utils/weather_response.dart';

class WeatherDatasouceMock extends Mock implements IWeatherDatasource {}

void main() {
  group('Weather Repository | ', () {
    late final IWeatherDatasource weatherDatasource;
    late final IWeatherRepository sut;

    setUpAll(() {
      weatherDatasource = WeatherDatasouceMock();
      sut = WeatherRepositoryImp(weatherDatasource);
      registerFallbackValue(GetWeatherDTO(place: 'Test Place'));
    });

    final response = ResponseService(
      data: weatherResponse,
      requestOptions: RequestOptionsService(
        path: faker.internet.httpsUrl(),
      ),
    );

    void mockSuccessDataBuilder() async {
      when(() => weatherDatasource.getWeather(any())).thenAnswer((_) async => response);
    }

    test('should be able to load a WeatherEntity', () async {
      mockSuccessDataBuilder();

      final result = await sut.getWeather(GetWeatherDTO(place: 'Test Place'));

      expect(result.fold(id, id), isA<WeatherEntity>());
    });

    test('should be able to load WeatherEntity data', () async {
      mockSuccessDataBuilder();

      final eitherResult = await sut.getWeather(GetWeatherDTO(place: 'Test Place'));

      final result = eitherResult.fold(id, id) as WeatherEntity;

      expect(result.temperature, isNotEmpty);
      expect(result.wind, isNotEmpty);
      expect(result.description, isNotEmpty);
      expect(result.forecasts.length, equals(3));
    });

    test('should be able to load a WeatherEntity with correct values', () async {
      mockSuccessDataBuilder();

      final eitherResult = await sut.getWeather(GetWeatherDTO(place: 'Test Place'));

      final result = eitherResult.fold(id, id) as WeatherEntity;

      expect(result.temperature, equals('14 °C'));
      expect(result.wind, equals('11 km/h'));
      expect(result.description, equals('Sunny'));
      expect(result.forecasts[0].temperature, equals('0 °C'));
    });
  });
}
