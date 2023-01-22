import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/shimmer/carousel_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CarouselHome extends StatelessWidget {
  const CarouselHome({super.key});

  @override
  Widget build(BuildContext context) {
    final carousalC = Get.put(HomeControll());
    return GetBuilder<HomeControll>(
      builder: (controller) =>controller.isLoding==false?CarouselShimmer(): CarouselSlider.builder(
          itemCount: carousalC.carouselList.length,
          itemBuilder: (BuildContext context, int index, int realIndex) =>
              // items: [
              //1st Image of Slider
              Stack(
                children: [
                  Card(
                    elevation: 50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        // color: Colors.yellow,
                        borderRadius: BorderRadius.circular(8.0),
                        // image: DecorationImage(
                        //   image: NetworkImage(
                        //     "https://www.nexhour.com/uploads/nexhour-ecommerce-india-private-limited/products/1-678795_l.jpg",
                        //   ),
                        //   // fit: BoxFit.cover,
                        // ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('up to'),
                              Text(
                                '13.7%',
                                style:
                                    TextStyle(fontSize: 28, color: Colors.red),
                              ),
                              Text('cash back')
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child:
                                // carousalC.carouselList.isEmpty?Text('empty'):
                                Image.network(
                              '${ApiBaseUrl().baseurl}/carousals/${carousalC.carouselList[0].image}',
                              height: 140,
                              width: 150,
                              alignment: Alignment(0.2, -9),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.09),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [new BoxShadow(blurRadius: 10.0)],
                        borderRadius: new BorderRadius.vertical(
                            bottom: new Radius.elliptical(60, 70.0)),
                        color: Color.fromARGB(255, 51, 51, 51),
                        // borderRadius:BorderRadius.only(bottomLeft: Radius.circular(7),bottomRight: Radius.circular(7))
                      ),
                      height: 45,
                      // color: Colors.yellow,)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 68.0, top: 20),
                    child: Text('offer closes soon...!',
                        style: GoogleFonts.akayaTelivigala(
                            fontSize: 20, color: Colors.yellow)),
                  )
                ],
              ),
          // Container(
          //   margin: EdgeInsets.all(6.0),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(8.0),
          //     image: DecorationImage(
          //       image: NetworkImage(
          //           "https://www.nexhour.com/uploads/nexhour-ecommerce-india-private-limited/products/1-678795_l.jpg"),
          //       // fit: BoxFit.cover,
          //     ),
          //   ),
          // ),

          options: CarouselOptions(
            height: 180.0,
            enlargeCenterPage: true,
            autoPlay: true,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            viewportFraction: 0.8,
          )),
    );
  }
}
