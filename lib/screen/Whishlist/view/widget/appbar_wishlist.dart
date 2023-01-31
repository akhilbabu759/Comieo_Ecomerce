import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppBarWishList extends StatelessWidget {
  const AppBarWishList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
           decoration: const BoxDecoration(
               color: colorWhite,
               backgroundBlendMode: BlendMode.hardLight,
               borderRadius: BorderRadius.only(
                   bottomLeft: Radius.circular(20),
                   bottomRight: Radius.circular(20))),
           // color: Colors.white,
           height: height * 0.13,
           child: Padding(
             padding: const EdgeInsets.all(12.0),
             child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   IconButton(
                       onPressed: () {
                        Get.back();
                        
                       },
                       icon: const Icon(Icons.arrow_back_ios)),
                   // SizedBox(width: width*0.04),
                   Text(
                     'Wishlist',
                     style: textstyle,
                   ),
                   Row(
                     children: [
                       // IconButton(
                       //     onPressed: () {},
                       //     icon: const Icon(
                       //       Icons.search,
                       //       color: colorblack,
                       //     )),
                       InkWell(
                           onTap: () {
                             Get.to(const CartScreen());
                           },
                           child: Image.network(
                             'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVvxBypuP3HbGsifk2_1iJrI8sxn9Gz6d508ZmsAA&s',
                             height: 24,
                           )),SizedBox(width:width*0.05 ,)
                     ],
                   )
                 ]),
           ),
         );
  }
}