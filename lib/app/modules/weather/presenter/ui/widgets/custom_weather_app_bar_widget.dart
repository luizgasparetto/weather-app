import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../../../../../core/components/custom_text_form_field.dart';
import '../../../../../core/components/custom_validated_button.dart';
import '../../controllers/home_controller.dart';

class CustomWeatherAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final WeatherController weatherController;

  const CustomWeatherAppBarWidget({Key? key, required this.weatherController}) : super(key: key);

  @override
  State<CustomWeatherAppBarWidget> createState() => _CustomWeatherAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _CustomWeatherAppBarWidgetState extends State<CustomWeatherAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    final weatherController = widget.weatherController;
    final size = MediaQuery.of(context).size;

    ValueNotifier<bool> isValid = ValueNotifier(false);

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
                                key: weatherController.formKey,
                                child: CustomTextFormField(
                                  onChanged: (value) {
                                    weatherController.place = value;
                                    isValid.value = weatherController.placeInstace.isValid;
                                  },
                                  validator: (_) => weatherController.placeInstace.hasError,
                                ),
                              ),
                              CustomValidatedButton(
                                buttonText: 'Choose',
                                isValid: isValid,
                                onPressed: () async {
                                  await weatherController.handleGetWeather();
                                  Modular.to.pop();
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
                weatherController.currentPlace!,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ],
      ),
    );
  }
}
