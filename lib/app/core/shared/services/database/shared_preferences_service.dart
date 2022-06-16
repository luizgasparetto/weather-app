import 'package:shared_preferences/shared_preferences.dart';

import '../../../../modules/home/domain/dtos/get_weather_dto.dart';
import '../../helpers/value_objects/place.dart';
import 'i_database_service.dart';

class SharedPreferencesService implements IDatabaseService {
  final SharedPreferences _prefs;

  const SharedPreferencesService(SharedPreferences prefs) : _prefs = prefs;

  @override
  Future<Place> getPlace() async {
    String? placeName = _prefs.getString('place');

    placeName ??= 'Curitiba';

    return Place(placeName);
  }

  @override
  Future<void> setPlace(GetWeatherDTO params) async {
    await _prefs.setString('place', params.place.value);
  }
}
