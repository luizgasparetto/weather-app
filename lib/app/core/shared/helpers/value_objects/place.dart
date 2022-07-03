import '../specifications/place_specifications.dart';
import 'i_value_object.dart';

class Place implements IValueObject {
  String value;

  Place([this.value = '']);

  @override
  bool get isValid => PlaceSpecifications.isSatisfiedBy(value);

  @override
  String? errorMessage = 'Invalid Place';

  @override
  String? get hasError => isValid ? null : errorMessage;

  @override
  void clear() => value = '';
}
