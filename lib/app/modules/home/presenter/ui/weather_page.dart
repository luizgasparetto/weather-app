import 'package:flutter/material.dart';

import '../../../../core/themes/colors.dart';
import '../controllers/home_controller.dart';
import 'widgets/app_bar/custom_app_bar.dart';
import 'widgets/current_weather/custom_info_content.dart';
import 'widgets/custom_gradient_background.dart';
import 'widgets/forecast/custom_forecast_listview.dart';

class WeatherPage extends StatefulWidget {
  final HomeController homeController;

  const WeatherPage({Key? key, required this.homeController}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.homeController.handleGetPlace();
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradientBackground(
      gradient: CustomColors.rain,
      child: Scaffold(
        appBar: CustomAppBar(weatherBloc: widget.homeController.weatherBloc),
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              CustomInfoContent(weatherBloc: widget.homeController.weatherBloc),
              CustomForecastListView(weatherBloc: widget.homeController.weatherBloc),
            ],
          ),
        ),
      ),
    );
  }
}
