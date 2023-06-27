import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/util/shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class CarouselShimmer extends StatelessWidget {
  const CarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        SizedBox(
          width: double.infinity,
          child: ShimmerWidget.rectangle(height: 150, width: double.infinity),
        ),
        kHeight10,
      ],
    );
  }
}
