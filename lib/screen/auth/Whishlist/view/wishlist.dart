import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/home/view/widget/side_Sheet/side_sheet_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

 class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    // final double width = size.width;
    return Scaffold(
      body:Column(children: [
         Container(
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
                             
                            },
                            icon: const Icon(Icons.menu)),
                        // SizedBox(width: width*0.04),
                        Text(
                          'Comieo',
                          style: textstyle,
                        ),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: colorblack,
                                )),
                            InkWell(
                                onTap: () {
                                  Get.to(const CartScreen());
                                },
                                child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVvxBypuP3HbGsifk2_1iJrI8sxn9Gz6d508ZmsAA&s',
                                  height: 24,
                                ))
                          ],
                        )
                      ]),
                ),
              )
      ]) ,

    );
  }
}