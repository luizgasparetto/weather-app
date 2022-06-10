import 'package:flutter/material.dart';

import 'widgets/custom_forecast_listview.dart';
import 'widgets/custom_info_content.dart';

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
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Column(
                  children: [
                    const CustomInfoContent(),
                    SizedBox(height: size.height * 0.06),
                  ],
                ),
              ),
            ),
            const CustomForecastListView(),
          ],
        ),
      ),
    );
  }
}
