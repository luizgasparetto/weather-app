import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/services/clients/dio_client_imp.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => Dio(), export: true),
        Bind.singleton((i) => DioClientImp(i()), export: true),
      ];
}
