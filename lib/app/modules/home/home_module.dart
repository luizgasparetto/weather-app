import 'package:flutter_modular/flutter_modular.dart';

import 'submodules/weather/weather_module.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/weather', module: WeatherModule()),
      ];
}
