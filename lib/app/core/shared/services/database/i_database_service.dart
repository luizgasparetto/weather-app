import '../../../../modules/home/domain/dtos/get_weather_dto.dart';
import '../../helpers/value_objects/place.dart';

abstract class IDatabaseService {
  Future<Place> getPlace();
  Future<void> setPlace(GetWeatherDTO params);
}
