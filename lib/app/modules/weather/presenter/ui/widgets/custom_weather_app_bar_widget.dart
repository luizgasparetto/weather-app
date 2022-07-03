import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/components/custom_elevated_button.dart';
import '../../../../../core/components/custom_text_form_field.dart';
import '../../controllers/home_controller.dart';

class CustomWeatherAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final WeatherController homeController;

  const CustomWeatherAppBarWidget({Key? key, required this.homeController}) : super(key: key);

  @override
  State<CustomWeatherAppBarWidget> createState() => _CustomWeatherAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomWeatherAppBarWidgetState extends State<CustomWeatherAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final homeController = widget.homeController;
    final size = MediaQuery.of(context).size;

    final formKey = GlobalKey<FormState>();

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
                  homeController.place = '';
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Theme.of(context).backgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        content: SizedBox(
                          width: size.width,
                          height: size.height / 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Choose your place',
                                style: Theme.of(context).textTheme.headline3,
                              ),
                              Form(
                                key: formKey,
                                child: CustomTextFormField(
                                  onChanged: (value) => homeController.place = value,
                                  validator: (_) => homeController.placeInstace.hasError,
                                ),
                              ),
                              CustomElevatedButton(
                                buttonText: 'Choose',
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await homeController.handleGetWeather();
                                    Modular.to.pop();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(width: size.width * 0.03),
              Text(
                homeController.currentPlace!,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ],
      ),
    );
  }
}
