import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_elevated_button.dart';
import 'custom_form_field.dart';

class CustomSearchDialog extends StatelessWidget {
  const CustomSearchDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
  }
}
