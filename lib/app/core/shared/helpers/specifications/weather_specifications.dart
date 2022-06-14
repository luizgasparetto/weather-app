import 'string_specifications.dart';

class PlaceSpecifications {
  static isSatisfiedBy(String? value) {
    return StringSpecifications.isSatisfiedBy(value) && value!.length >= 3;
  }
}
