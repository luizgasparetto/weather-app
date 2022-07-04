import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/shared/components/custom_gradient_background.dart';
import '../../../../core/themes/custom_gradients.dart';
import '../controllers/home_controller.dart';
import '../stores/weather/weather_bloc.dart';
import 'widgets/custom_current_weather_info_widget.dart';
import 'widgets/custom_forecast_listview.dart';
import 'widgets/custom_weather_app_bar_widget.dart';
import 'widgets/shimmer/shimmer_current_info_content.dart';
import 'widgets/shimmer/shimmer_forecast_listview.dart';
import 'widgets/shimmer/shimmer_weather_app_bar.dart';

class WeatherPage extends StatefulWidget {
  final WeatherBloc weatherBloc;
  final WeatherController weatherController;

  const WeatherPage({Key? key, required this.weatherBloc, required this.weatherController}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  void initState() {
    widget.weatherController.handleGetWeather();
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
                    ShimmerCurrentWeatherInfoWidget(),
                    ShimmerForecastListView(),
                  ],
                ),
              ),
            ),
          );
        } else if (state is WeatherLoadedState) {
          return CustomGradientBackground(
            gradient: state.gradient,
            child: Scaffold(
              appBar: CustomWeatherAppBarWidget(
                weatherController: widget.weatherController,
              ),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    CustomCurrentWeatherInfoWidget(
                      weatherImage: state.image,
                      weather: state.weather,
                    ),
                    CustomForecastListViewWidget(
                      forecasts: state.weather.forecasts,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return CustomGradientBackground(
            gradient: CustomGradients.errorGradient,
            child: Scaffold(
              appBar: CustomWeatherAppBarWidget(weatherController: widget.weatherController),
              backgroundColor: Colors.transparent,
              body: const SafeArea(
                child: CustomScrollView(
                  slivers: [],
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
