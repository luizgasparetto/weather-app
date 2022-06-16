import 'package:dio/dio.dart';
import "package:faker/faker.dart";
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:weather_app/app/core/shared/exceptions/exceptions.dart';
import 'package:weather_app/app/core/shared/services/clients/dio_client_imp.dart';
import 'package:weather_app/app/core/shared/services/clients/i_client_service.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final url = faker.internet.httpUrl();
  final sut = DioClientImp(dio);

  final response = ResponseService(
    requestOptions: RequestOptions(path: faker.internet.httpsUrl()),
  );

  group('Dio Client | ', () {
    test('should be able to establish a connection and return a ResponseService', () async {
      when(() => dio.get(any())).thenAnswer((_) async => response);

      final result = await sut.get(url);

      expect(result, isA<ResponseService>());
    });

    test('should throw a ClientException when try to establish connection', () async {
      when(() => dio.get(any())).thenThrow(ClientException(message: ''));

      final result = sut.get(url);

      expect(result, throwsA(isA<ClientException>()));
    });
  });
}
