import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/ui/weather_page.dart';

class HomeModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, __) => const WeatherPage()),
      ];
}
