import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app/app/core/shared/helpers/specifications/string_specifications.dart';

void main() {
  group('String Specifications | ', () {
    test('should return true when the string is not empty and it\'s not null', () {
      expect(StringSpecifications.isSatisfiedBy('value'), equals(true));
    });

    test('should return false when the string is empty or null', () {
      expect(StringSpecifications.isSatisfiedBy(''), equals(false));
      expect(StringSpecifications.isSatisfiedBy(null), equals(false));
    });
  });
}
