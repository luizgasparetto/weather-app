import 'package:flutter_modular/flutter_modular.dart';

import 'core/core_module.dart';
import 'modules/weather/weather_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(Modular.initialRoute, module: WeatherModule()),
      ];
}
