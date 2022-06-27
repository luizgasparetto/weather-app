import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.7),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: size.width * 0.03),
              Padding(
                padding: const EdgeInsets.only(top: 7),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade200.withOpacity(0.5),
                  highlightColor: Colors.white.withOpacity(0.7),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
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
