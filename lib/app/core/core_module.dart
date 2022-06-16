import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared/services/clients/dio_client_imp.dart';
import 'shared/services/database/shared_preferences_service.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => Dio(), export: true),
        Bind.singleton((i) => DioClientImp(i()), export: true),
        //
        AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
        Bind.singleton((i) => SharedPreferencesService(i())),
      ];
}
