import 'package:badges/badges.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';

import 'package:ecomerce/screen/Whishlist/view/wishlist.dart';
import 'package:ecomerce/screen/account/account_main/view/account.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';


import 'package:ecomerce/screen/home/view/widget/afterAppBar/after_appbar.dart';

import 'package:ecomerce/screen/home/view/widget/side_Sheet/side_sheet_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    final cartController = Get.put(CartController());
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: const BoxDecoration(
                    color: colorWhite,
                    backgroundBlendMode: BlendMode.hardLight,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                height: height * 0.13,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              SideSheet.left(
                                  body: Column(
                                    children: [
                                      Container(
                                        color: Colors.blueGrey[900],
                                        height: 130,
                                        width: 294,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 63.0, left: 10),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Hey!',
                                                  style: TextStyle(
                                                      color: colorWhite,
                                                      fontSize: 20),
                                                ),
                                                Row(
                                                  children: const [
                                                    SizedBox(
                                                      width: 30,
                                                    ),
                                                    Text(
                                                      'Akhil ',
                                                      style: TextStyle(
                                                          color: colorWhite,
                                                          fontSize: 29),
                                                    ),
                                                  ],
                                                )
                                              ]),
                                        ),
                                      ),
                                      GestureDetector(
                                          onTap: () => Get.to(const WishList()),
                                          child: const SideSheetRow(
                                            icon: Icon(Icons.favorite),
                                            text: 'Wishlist',
                                          )),
                                      textFieldGap,
                                      GestureDetector(
                                          onTap: () => Get.to(const Account()),
                                          child: const SideSheetRow(
                                            icon: Icon(Icons.account_circle),
                                            text: 'Account',
                                          )),
                                      textFieldGap,
                                      GestureDetector(
                                          child: const SideSheetRow(
                                        icon: Icon(Icons.shopping_basket),
                                        text: 'Order',
                                      )),
                                      textFieldGap,
                                      GestureDetector(
                                        child: const SideSheetRow(
                                          icon: Icon(Icons.question_answer),
                                          text: 'Contact us',
                                        ),
                                      ),
                                      textFieldGap,
                                      GestureDetector(
                                          child: const SideSheetRow(
                                        icon: Icon(Icons.help_center),
                                        text: 'Help',
                                      )),
                                      const SizedBox(
                                        height: 300,
                                      ),
                                      const Text(
                                        'Version 1.0',
                                        style: TextStyle(color: colorblack),
                                      )
                                    ],
                                  ),
                                  context: context);
                            },
                            icon: const Icon(Icons.menu)),
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
                              child: GetBuilder<CartController >(builder: (controller) {
                                return 
                                //  == null
                                //     ? Icon(Icons.shopping_cart_outlined)
                                //     : 
                                    Badge(
                                        position: BadgePosition.topEnd(
                                            top: 10, end: 10),
                                        badgeContent: Text(cartController
                                            .cartList!.products.length
                                            .toString()),
                                        child: const Icon(Icons.shopping_cart_outlined));
                              },
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
            ),
            Expanded(
                child: ListView(
                    children: [AfterAppBar(height: height, width: width)])),
          ],
        ),
      ),
    );
  }
}
