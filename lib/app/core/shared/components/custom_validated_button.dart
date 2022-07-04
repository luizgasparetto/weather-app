// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomValidatedButton extends StatefulWidget {
  final String buttonText;
  final void Function()? onPressed;
  ValueNotifier<bool> isValid;

  CustomValidatedButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.isValid,
  }) : super(key: key);

  @override
  State<CustomValidatedButton> createState() => _CustomValidatedButtonState();
}

class _CustomValidatedButtonState extends State<CustomValidatedButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: widget.isValid,
      builder: (_, value, __) {
        return SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: value ? widget.onPressed : null,
            style: ElevatedButton.styleFrom(
              primary: value ? Colors.lightBlue : Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
