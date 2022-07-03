import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/core/shared/helpers/specifications/place_specifications.dart';

void main() {
  group('Place Specifications | ', () {
    test('should return false when place is empty or null', () {
      expect(PlaceSpecifications.isSatisfiedBy(''), equals(false));
      expect(PlaceSpecifications.isSatisfiedBy(null), equals(false));
    });

    test('should return false when place\'s length is less than 3', () {
      expect(PlaceSpecifications.isSatisfiedBy('xx'), equals(false));
    });

    test('should return true when place is valid', () {
      expect(PlaceSpecifications.isSatisfiedBy('place'), equals(true));
    });
  });
}
