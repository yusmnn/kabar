import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../consts/color.dart';
import '../../consts/utils.dart';

class LoadingTrendingWidget extends StatelessWidget {
  const LoadingTrendingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = Utils(context).screenSize;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Shimmer.fromColors(
        baseColor: blue1,
        highlightColor: primaryColor,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: Colors.grey.withOpacity(0.2),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(12.0),
            ),
            child: SizedBox(
              height: size.height * 0.30,
              width: size.width,
            ),
          ),
        ),
      ),
    );
  }
}
