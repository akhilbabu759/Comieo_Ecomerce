import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/common/api_baseurl.dart';

import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/shimmer/carousel_shimmer.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              itemBuilder: (BuildContext context, int index, int realIndex) =>Container(
                child: Image.network(
              '${ApiBaseUrl().baseurl}/carousals/${carousalC.carouselList[index].image}')),
                  // Stack(
                  //   children: [
                  //     Card(
                  //       elevation: 50,
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(30),
                  //       ),
                  //       child: Container(
                  //         margin: const EdgeInsets.all(6.0),
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         child: Row(
                  //           crossAxisAlignment: CrossAxisAlignment.end,
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               children: [
                  //                 const Text('up to'),
                  //                 Text(
                  //                   '${carousalC.carouselList[index].offer}%',
                  //                   style: const TextStyle(
                  //                       fontSize: 28, color: Colors.red),
                  //                 ),
                  //                 const Text('cash back')
                  //               ],
                  //             ),
                  //             Image.network(
                  //               fit: BoxFit.cover,
                  //               '${ApiBaseUrl().baseurl}/carousals/${carousalC.carouselList[index].image}',
                  //               height: 140,
                  //               width: 150,
                  //               alignment: const Alignment(0.2, -9),
                  //             )
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(top: 4.09),
                  //       child: Container(
                  //         decoration: const BoxDecoration(
                  //           boxShadow: [
                  //             BoxShadow(blurRadius: 10.0),
                  //           ],
                  //           borderRadius: BorderRadius.vertical(
                  //               bottom: Radius.elliptical(
                  //             60,
                  //             70.0,
                  //           )),
                  //           color: Color.fromARGB(
                  //             255,
                  //             51,
                  //             51,
                  //             51,
                  //           ),
                  //         ),
                  //         height: 45,
                  //       ),
                  //     ),
                  //     Padding(
                  //       padding: const EdgeInsets.only(left: 68.0, top: 20),
                  //       child: Text('Limited Stock...!',
                  //           style: GoogleFonts.akayaTelivigala(
                  //               fontSize: 20, color: Colors.yellow)),
                  //     )
                  //   ],
                  // ),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              )),
    );
  }
}
