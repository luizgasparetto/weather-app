import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/modules/weather/infra/errors/infra_errors.dart';
import 'package:weather_app/app/modules/weather/infra/mappers/forecast_mapper.dart';

void main() {
  final correctMap = {
    'day': 'x',
    'temperature': 'x',
    'wind': 'x',
  };

  final failureMap = {
    'xxxx': 'x',
    'xxx': 'x',
    'xx': 'x',
  };

  group('Forecast Mapper | ', () {
    test('should return an instance of ForecastMapper when use an correct map', () {
      final mapper = ForecastMapper.fromMap(correctMap);

      expect(mapper.day, equals('x'));
      expect(mapper.temperature, equals('x'));
      expect(mapper.wind, equals('x'));
    });

    test('should return an ForecastMapperException when use an incorrect map', () {
      expect(() => ForecastMapper.fromMap(failureMap), throwsA(ForecastMapperException));
    });
  });
}
