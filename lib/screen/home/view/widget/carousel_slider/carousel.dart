import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/common/api_baseurl.dart';

import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/shimmer/carousel_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeControll());
    log(carousalC.carouselList.length.toString(), name: 'carouselCaheck');
    return GetBuilder<HomeControll>(
      builder: (controller) => carousalC.isLoding == true
          ? const CarouselShimmer()
          : CarouselSlider.builder(
              itemCount: carousalC.carouselList.length,
              itemBuilder: (BuildContext context, int index, int realIndex) =>
                  carousalC.carouselList.isEmpty
                      ? const CarouselShimmer()
                      : Image.network(
                          '${ApiBaseUrl().baseurl}/carousals/${carousalC.carouselList[index].image}'),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 1,
              )),
    );
  }
}
