import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/list_card.dart';
import 'package:ecomerce/screen/home/view/widget/carousel_slider/carousel.dart';
import 'package:ecomerce/screen/home/view/widget/heding/heding.dart';
import 'package:ecomerce/screen/home/view/widget/home_grideviewe/grid_view.dart';
import 'package:flutter/material.dart';

class AfterAppBar extends StatelessWidget {
  const AfterAppBar({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Card(elevation: 3, child: CarouselHome()),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(children: [
            textFieldGap,
            textFieldGap,
            textFieldGap,
            const HomeHeading(
              tex: 'Top Deals in',
            ),
            textFieldGap,
            const CardView(),
            textFieldGap,
            const HomeHeading(
              tex: 'All shops',
            ),
            textFieldGap,
            HomeGridView(
              height: height ,
              width: width * 0.9,
            )
          ]),
        ),
      ],
    );
  }
}
