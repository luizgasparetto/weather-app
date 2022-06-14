import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:weather_app/app/core/shared/exceptions/exceptions.dart';
import 'package:weather_app/app/core/shared/services/clients/i_client_service.dart';
import 'package:weather_app/app/modules/home/submodules/weather/domain/dtos/get_weather_dto.dart';
import 'package:weather_app/app/modules/home/submodules/weather/external/datasources/weather_datasource_imp.dart';
import 'package:weather_app/app/modules/home/submodules/weather/infra/datasources/i_weather_datasource.dart';

class DioClientMock extends Mock implements IClientService {}

void main() {
  group('Weather datasource | ', () {
    late final IClientService dioClient;
    late final IWeatherDatasource sut;

    setUpAll(() {
      dioClient = DioClientMock();
      sut = WeatherDatasourceImp(dioClient);
    });

    final response = ResponseService(
      data: faker.randomGenerator.string(10),
      requestOptions: RequestOptions(
        path: faker.internet.httpsUrl(),
      ),
    );

    test('should be able to get a ResponseService instace with data', () async {
      when(() => dioClient.get(any())).thenAnswer((_) async => response);

      final result = await sut.getWeather(GetWeatherDTO(place: 'Test Place'));

      expect(result, isA<ResponseService>());
      expect(result.data, isNotEmpty);
    });

    test('should throw a ClientException when calls datasource', () async {
      when(() => dioClient.get(any())).thenThrow(ClientException(message: 'Test Error'));

      final result = sut.getWeather(GetWeatherDTO(place: 'Test Place'));

      expect(result, throwsA(isA<ClientException>()));
    });
  });
}
