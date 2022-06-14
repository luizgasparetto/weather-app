import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/services/clients/dio_client_imp.dart';

// TODO - Refactor core's modules by spliting in specific modules. E.g: Have one module for services and
// other module for adapters.
class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => Dio(), export: true),
        Bind.factory((i) => DioClientImp(i()), export: true),
      ];
}
