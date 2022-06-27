import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/themes/custom_gradients.dart';
import '../controllers/home_controller.dart';
import '../stores/weather/weather_bloc.dart';
import 'widgets/app_bar/shimmer_app_bar.dart';
import 'widgets/current_info_content/custom_current_info_content.dart';
import 'widgets/current_info_content/shimmer_current_info_content.dart';
import 'widgets/custom_gradient_background.dart';
import 'widgets/forecast/custom_forecast_listview.dart';

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

  // TODO - REFACTOR: REMOVE BLOC FROM EVERY WIDGET AND JUST RETURN THE CORRECT DATA TO THEM
  // USING THE IF/ELSE STATEMENT INSIDE MY MAIN PAGE

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      bloc: widget.weatherBloc,
      builder: (_, state) {
        if (state is WeatherLoadingState) {
          return CustomGradientBackground(
            gradient: CustomGradients.loadingGradient,
            child: Scaffold(
              appBar: const ShimmerAppBar(),
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
        } else if (state is WeatherLoadedState) {
          return CustomGradientBackground(
            gradient: CustomGradients.loadingGradient,
            child: Scaffold(
              appBar: const ShimmerAppBar(),
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: CustomScrollView(
                  slivers: [
                    const ShimmerInfoContent(),
                    CustomForecastListView(weatherBloc: widget.homeController.weatherBloc),
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
      },
    );
  }
}

// Loaded
// return CustomGradientBackground(
//             gradient: state.weatherGradient,
//             child: Scaffold(
//               appBar: CustomAppBar(weatherBloc: widget.homeController.weatherBloc),
//               backgroundColor: Colors.transparent,
//               body: SafeArea(
//                 child: CustomScrollView(
//                   slivers: [
//                     CustomInfoContent(weatherBloc: widget.homeController.weatherBloc),
//                     CustomForecastListView(weatherBloc: widget.homeController.weatherBloc),
//                   ],
//                 ),
//               ),
//             ),
//           );