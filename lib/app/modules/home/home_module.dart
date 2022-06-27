import 'package:flutter_modular/flutter_modular.dart';

import 'domain/repositories/i_weather_repository.dart';
import 'domain/usecases/get_weather/get_weather_usecase_imp.dart';
import 'domain/usecases/get_weather/i_get_weather_usecase.dart';
import 'external/datasources/weather_datasource_imp.dart';
import 'infra/datasources/i_weather_datasource.dart';
import 'infra/repositories/weather_repository_imp.dart';
import 'presenter/controllers/home_controller.dart';
import 'presenter/stores/weather/weather_bloc.dart';
import 'presenter/ui/home_page.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory<IWeatherDatasource>((i) => WeatherDatasourceImp(i())),
        Bind.factory<IWeatherRepository>((i) => WeatherRepositoryImp(i())),
        Bind.factory<IGetWeatherUsecase>((i) => GetWeatherUsecaseImp(i())),
        Bind.singleton<WeatherBloc>((i) => WeatherBloc(i())),
        Bind.singleton<HomeController>((i) => HomeController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => HomePage(
            weatherBloc: context.read<WeatherBloc>(),
            homeController: context.read<HomeController>(),
          ),
        ),
      ];
}
