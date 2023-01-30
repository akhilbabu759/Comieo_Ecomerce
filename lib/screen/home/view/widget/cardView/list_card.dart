
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/shimmer/category_shimmer.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/home_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardView extends StatelessWidget {
  const CardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControll>(builder: (controller) =>controller.isLoding==true?const CategoryShimmer():  LimitedBox(
      maxHeight: 175,
      child: ListView.builder( 
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: SizedBox(width: 170,
                  child: HomeCard(imag:controller.categorylList[index].image ,text:controller.categorylList[index].name)),
              )),
    ));
  }
}
