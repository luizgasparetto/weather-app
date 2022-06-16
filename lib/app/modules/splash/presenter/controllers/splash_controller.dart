import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  void _navigateToHome() => Modular.to.navigate('/home/');

  Future<void> initApp() async {
    await Future.delayed(const Duration(seconds: 3));

    _navigateToHome();
  }
}
