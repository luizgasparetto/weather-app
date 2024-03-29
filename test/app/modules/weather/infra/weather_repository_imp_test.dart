import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/app/core/shared/helpers/value_objects/place.dart';
import 'package:weather_app/app/core/shared/services/clients/dio_client_imp.dart';

import 'package:weather_app/app/core/shared/services/clients/i_client_service.dart';
import 'package:weather_app/app/modules/weather/domain/dtos/get_weather_dto.dart';
import 'package:weather_app/app/modules/weather/domain/entities/weather_entity.dart';
import 'package:weather_app/app/modules/weather/domain/repositories/i_weather_repository.dart';
import 'package:weather_app/app/modules/weather/infra/datasources/i_weather_datasource.dart';
import 'package:weather_app/app/modules/weather/infra/repositories/weather_repository_imp.dart';

import '../../../../utils/weather_response.dart';

class WeatherDatasouceMock extends Mock implements IWeatherDatasource {}

void main() {
  group('Weather Repository | ', () {
    late final IWeatherDatasource weatherDatasource;
    late final IWeatherRepository sut;
    late final Place defaultPlace;

    setUpAll(() {
      weatherDatasource = WeatherDatasouceMock();
      sut = WeatherRepositoryImp(weatherDatasource);
      defaultPlace = Place('Test Place');
      registerFallbackValue(GetWeatherDTO(place: defaultPlace));
    });

    final response = ResponseService(
      data: weatherResponse,
      requestOptions: RequestOptionsService(
        path: 'test.url',
      ),
    );

    void mockSuccessDataBuilder() async {
      when(() => weatherDatasource.getWeather(any())).thenAnswer((_) async => response);
    }

    test('should be able to load a WeatherEntity', () async {
      mockSuccessDataBuilder();

      final result = await sut.getWeatherInfo(GetWeatherDTO(place: defaultPlace));

      expect(result.fold(id, id), isA<WeatherEntity>());
    });

    test('should be able to load WeatherEntity data', () async {
      mockSuccessDataBuilder();

      final eitherResult = await sut.getWeatherInfo(GetWeatherDTO(place: defaultPlace));

      final result = eitherResult.fold(id, id) as WeatherEntity;

      expect(result.temperature, isNotEmpty);
      expect(result.wind, isNotEmpty);
      expect(result.description, isNotEmpty);
      expect(result.forecasts.length, equals(3));
    });

    test('should be able to load a WeatherEntity with correct values', () async {
      mockSuccessDataBuilder();

      final eitherResult = await sut.getWeatherInfo(GetWeatherDTO(place: defaultPlace));

      final result = eitherResult.fold(id, id) as WeatherEntity;

      expect(result.temperature, equals('14 °C'));
      expect(result.wind, equals('11 km/h'));
      expect(result.description, equals('Sunny'));
      expect(result.forecasts[0].temperature, equals('0 °C'));
    });
  });
}
