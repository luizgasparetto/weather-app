import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import 'custom_search_dialog.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.035),
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
              Text(
                'San Francisco',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
          const Icon(IconlyLight.calendar),
        ],
      ),
    );
  }
}
