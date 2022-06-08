import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/controllers/splash_controller.dart';
import 'presenter/splash_page.dart';

class SplashModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => SplashController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (context, __) => SplashPage(splashController: context.read()),
        ),
      ];
}
