import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iconly/iconly.dart';

import '../custom_elevated_button.dart';
import '../custom_form_field.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String weatherDescription;

  const CustomAppBar({Key? key, required this.weatherDescription}) : super(key: key);

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
                                'Choose your country',
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const Form(
                                child: CustomFormField(),
                              ),
                              CustomElevatedButton(
                                buttonText: 'Choose',
                                onPressed: () => Modular.to.pop(),
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
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Text(
                  widget.weatherDescription,
                  style: Theme.of(context).textTheme.headline3,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
