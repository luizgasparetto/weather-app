import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/core/shared/helpers/value_objects/place.dart';

void main() {
  late Place place;

  setUp(() {
    place = Place();
  });

  group('Place Value Object | ', () {
    test('should return null when a place has no errors', () {
      place.value = 'Test Place';

      expect(place.hasError, equals(null));
    });

    test('should return an error message when has error', () {
      place.value = '';

      expect(place.hasError, isNot(equals(null)));
    });
  });
}
