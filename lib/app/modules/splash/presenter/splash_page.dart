import 'package:flutter/material.dart';

import 'controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController splashController;

  const SplashPage({
    Key? key,
    required this.splashController,
  }) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    widget.splashController.initApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
