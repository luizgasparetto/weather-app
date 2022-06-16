import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconly/iconly.dart';

import '../../../stores/weather/weather_bloc.dart';
import 'custom_search_dialog.dart';
import 'shimmer/shimmer_app_bar_text.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final WeatherBloc weatherBloc;

  const CustomAppBar({Key? key, required this.weatherBloc}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(
                  IconlyBold.location,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const CustomSearchDialog();
                    },
                  );
                },
              ),
              SizedBox(width: size.width * 0.03),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: BlocBuilder<WeatherBloc, WeatherState>(
                  bloc: widget.weatherBloc,
                  builder: (_, state) {
                    if (state is WeatherLoadingState) {
                      return const ShimmerAppBarText();
                    } else if (state is WeatherLoadedState) {
                      return Text(
                        state.weather.description,
                        style: Theme.of(context).textTheme.headline3,
                      );
                    } else {
                      return Text(
                        'Error Place :(',
                        style: Theme.of(context).textTheme.headline3,
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
