import 'package:flutter/material.dart';

import 'custom_weather_details.dart';

class CustomInfoContent extends StatelessWidget {
  const CustomInfoContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
      child: Column(
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.65,
              child: Image.asset('assets/icons/rain.png'),
            ),
          ),
          SizedBox(height: size.height * 0.03),
          const CustomWeatherDetails(),
        ],
      ),
    );
  }
}
