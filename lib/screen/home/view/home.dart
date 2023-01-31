import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:ecomerce/screen/Whishlist/view/wishlist.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/widget/afterAppBar/after_appbar.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/list_card.dart';
import 'package:ecomerce/screen/home/view/widget/carousel_slider/carousel.dart';
import 'package:ecomerce/screen/home/view/widget/heding/heding.dart';
import 'package:ecomerce/screen/home/view/widget/side_Sheet/side_sheet_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

import 'widget/home_grideviewe/grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final homeControl = Get.put(HomeControll());
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      // bottomNavigationBar: BottomNavigator(),
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
                // color: Colors.white,
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
                                        color: Colors.blueGrey[100],
                                        height: 130,
                                        width: 292,
                                        child: Column(children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.account_circle_outlined,
                                                size: 36,
                                              )),
                                          textFieldGap,
                                          const Text(
                                            'Akhil ',
                                            style: TextStyle(
                                                color: colorblack,
                                                fontSize: 29),
                                          )
                                        ]),
                                      ),
                                       SideSheetRow(icon: IconButton( onPressed: () => Get.to(WishList()),icon: Icon(Icons.favorite)),text: 'Wishlist',),
                                      
                                       textFieldGap,
                                       SideSheetRow(icon: IconButton(onPressed: () {
                                        
                                      },icon: Icon(Icons.shopping_basket)),text: 'Order',),
               
                                      textFieldGap,
                                       SideSheetRow(icon: IconButton(onPressed: () {
                                        
                                      },icon: Icon(Icons.question_answer)),text: 'Contact us',),
                                       textFieldGap,
                                       SideSheetRow(icon: IconButton(onPressed: () {
                                        
                                      },icon: Icon(Icons.help_center)),text: 'Help',),
                                    ],
                                  ),
                                  context: context);
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
              ),
            ),
            Expanded(
                child: ListView(
                    children: [AfterAppBar(height: height, width: width)])),
          ],
        ),
      ),
      // child: Text('home')),
    );
  }
}

