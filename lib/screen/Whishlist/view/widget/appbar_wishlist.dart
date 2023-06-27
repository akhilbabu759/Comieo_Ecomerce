import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      height: height * 0.13,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Text(
            'Wishlist',
            style: textstyle,
          ),
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Get.to(const CartScreen());
                  },
                  child: const Icon(Icons.shopping_cart_outlined)),
              SizedBox(
                width: width * 0.05,
              )
            ],
          )
        ]),
      ),
    );
  }
}
