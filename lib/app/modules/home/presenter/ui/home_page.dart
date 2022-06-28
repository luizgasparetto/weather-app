import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/custom_gradients.dart';
import '../controllers/home_controller.dart';
import '../stores/weather/weather_bloc.dart';
import 'widgets/app_bar/custom_app_bar.dart';
import 'widgets/app_bar/shimmer_app_bar.dart';
import 'widgets/current_info_content/custom_current_info_content.dart';
import 'widgets/current_info_content/shimmer_current_info_content.dart';
import 'widgets/custom_gradient_background.dart';
import 'widgets/forecast/custom_forecast_listview.dart';
import 'widgets/forecast/shimmer_forecast_listview.dart';

class HomePage extends StatefulWidget {
  final WeatherBloc weatherBloc;
  final HomeController homeController;

  const HomePage({Key? key, required this.weatherBloc, required this.homeController}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.homeController.handleGetWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: widget.weatherBloc,
      builder: (_, state) {
        if (state is WeatherLoadingState) {
          return CustomGradientBackground(
            gradient: CustomGradients.loadingGradient,
            child: const Scaffold(
              appBar: ShimmerAppBar(),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    ShimmerInfoContent(),
                    ShimmerForecastListView(),
                  ],
                ),
              ),
            ),
          );
        } else if (state is WeatherLoadedState) {
          return CustomGradientBackground(
            gradient: state.weatherGradient,
            child: Scaffold(
              appBar: CustomAppBar(weatherDescription: state.weather.description),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    CustomInfoContent(
                      weatherImage: state.weatherImage,
                      weather: state.weather,
                    ),
                    CustomForecastListView(forecasts: state.weather.forecasts),
                  ],
                ),
              ),
            ),
          );
        } else {
          // TODO - Make Error Widgets
          return CustomGradientBackground(
            gradient: CustomGradients.rain,
            child: Scaffold(
              appBar: AppBar(),
              backgroundColor: Colors.transparent,
              body: const SafeArea(
                child: CustomScrollView(
                  slivers: [
                    //CustomInfoContent(weatherBloc: widget.homeController.weatherBloc),
                    //CustomForecastListView(weatherBloc: widget.homeController.weatherBloc),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

// Loaded
