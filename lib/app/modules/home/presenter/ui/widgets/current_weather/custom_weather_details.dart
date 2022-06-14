import 'package:flutter/material.dart';

class CustomWeatherDetails extends StatelessWidget {
  const CustomWeatherDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: size.width * 0.08),
          child: Text(
            '16 º',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        SizedBox(
          width: size.width * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wind_power_outlined,
                color: Theme.of(context).primaryColor,
              ),
              const Spacer(),
              const Text('10 km/h'),
            ],
          ),
        ),
      ],
    );
  }
}
