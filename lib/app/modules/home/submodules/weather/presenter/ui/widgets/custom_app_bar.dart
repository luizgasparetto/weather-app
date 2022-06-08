import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                IconlyBold.location,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(width: size.width * 0.05),
              Text(
                'San Francisco',
                style: Theme.of(context).textTheme.headline3,
              ),
              SizedBox(width: size.width * 0.05),
              Icon(
                IconlyBold.arrow_down_2,
                color: Theme.of(context).primaryColor,
                size: 16,
              ),
            ],
          ),
          const Icon(IconlyLight.calendar),
        ],
      ),
    );
  }
}
