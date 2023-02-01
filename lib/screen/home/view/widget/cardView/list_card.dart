
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
     final productC = Get.put(HomeControll());
    return GetBuilder<HomeControll>(builder: (controller) =>productC.isLoding==true?const CategoryShimmer():  LimitedBox(
      maxHeight: 175,
      child: ListView.builder( 
          itemCount:productC.categorylList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: SizedBox(width: 170,
                  child: HomeCard(imag:productC.categorylList[index].image ,text:productC.categorylList[index].name)),
              )),
    ));
  }
}
