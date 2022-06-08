import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  void _navigateToWeather() => Modular.to.navigate('/home/weather/');

  Future<void> initApp() async {
    await Future.delayed(const Duration(seconds: 2));

    _navigateToWeather();
  }
}
