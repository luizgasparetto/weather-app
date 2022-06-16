import 'package:flutter_modular/flutter_modular.dart';

import '../../core/core_module.dart';
import 'domain/usecases/get_weather/get_weather_usecase_imp.dart';
import 'external/datasources/weather_datasource_imp.dart';
import 'infra/repositories/weather_repository_imp.dart';
import 'presenter/controllers/home_controller.dart';
import 'presenter/stores/weather/weather_bloc.dart';
import 'presenter/ui/weather_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => WeatherDatasourceImp(i())),
        Bind.factory((i) => WeatherRepositoryImp(i())),
        Bind.factory((i) => GetWeatherUsecaseImp(i())),
        Bind.singleton((i) => WeatherBloc(i())),
        Bind.singleton((i) => HomeController(i(), i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => WeatherPage(
            homeController: context.read(),
          ),
        ),
      ];
}
