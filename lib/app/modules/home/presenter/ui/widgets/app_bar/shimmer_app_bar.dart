import 'package:flutter/material.dart';

import '../shimmer_default.dart';

class ShimmerAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ShimmerAppBar({Key? key}) : super(key: key);

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
              const Padding(
                padding: EdgeInsets.only(top: 7),
                child: ShimmerDefault(width: 50),
              ),
              SizedBox(width: size.width * 0.03),
              const Padding(
                padding: EdgeInsets.only(top: 7),
                child: ShimmerDefault(width: 200),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
