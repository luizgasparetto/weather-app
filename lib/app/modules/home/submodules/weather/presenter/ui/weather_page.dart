import 'package:flutter/material.dart';

import 'widgets/app_bar/custom_app_bar.dart';
import 'widgets/current_weather/custom_info_content.dart';
import 'widgets/forecast/custom_forecast_listview.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color.fromRGBO(89, 231, 253, 1),
            Color.fromRGBO(89, 203, 247, 1),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: const [
                    CustomAppBar(),
                    CustomInfoContent(),
                  ],
                ),
              ),
              const CustomForecastListView(),
            ],
          ),
        ),
      ),
    );
  }
}
