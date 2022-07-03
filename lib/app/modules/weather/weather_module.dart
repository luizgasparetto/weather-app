import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/i_weather_repository.dart';

import 'domain/usecases/get_current_weather/get_current_weather_usecase_imp.dart';
import 'domain/usecases/get_current_weather/i_get_current_weather_usecase.dart';
import 'external/datasources/weather_datasource_imp.dart';
import 'infra/datasources/i_weather_datasource.dart';
import 'infra/repositories/weather_repository_imp.dart';
import 'presenter/controllers/home_controller.dart';
import 'presenter/stores/weather/weather_bloc.dart';
import 'presenter/ui/weather_page.dart';

class WeatherModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton<IWeatherDatasource>((i) => WeatherDatasourceImp(i())),
        Bind.lazySingleton<IWeatherRepository>((i) => WeatherRepositoryImp(i())),
        Bind.lazySingleton<IGetCurrentWeatherUsecase>((i) => GetCurrentWeatherUsecaseImp(i())),
        Bind.singleton<WeatherBloc>((i) => WeatherBloc(i())),
        Bind.singleton<WeatherController>((i) => WeatherController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => WeatherPage(
            weatherBloc: context.read<WeatherBloc>(),
            homeController: context.read<WeatherController>(),
          ),
        ),
      ];
}
