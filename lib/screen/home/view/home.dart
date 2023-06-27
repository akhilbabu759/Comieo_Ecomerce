import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';

import 'package:ecomerce/screen/Whishlist/view/wishlist.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';

import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';

import 'package:ecomerce/screen/home/view/widget/search/search.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ecomerce/screen/home/view/widget/afterAppBar/after_appbar.dart';

import 'package:ecomerce/screen/home/view/widget/side_Sheet/side_sheet_row.dart';
import 'package:ecomerce/screen/order_place_page.dart/view/order_place.dart';
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
    final accountC = Get.put(AcountController());
    final homeC=Get.put(HomeControll());
    return GetBuilder<CartController>(
      builder: (controller) {
        return cartController.isLoading == true.obs
            ? const Center(
                child: CircularProgressIndicator(
                  color: colorWhite,
                  backgroundColor: Colors.cyan,
                ),
              )
            : Scaffold(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 63.0,
                                                            left: 10),
                                                    child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          const Text(
                                                            'Hey!',
                                                            style: TextStyle(
                                                                color:
                                                                    colorWhite,
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
                                                                    color:
                                                                        colorWhite,
                                                                    fontSize:
                                                                        29),
                                                              ),
                                                            ],
                                                          )
                                                        ]),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 15.0, left: 5),
                                                  child: Column(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => Get.to(
                                                            const WishList()),
                                                        child:
                                                            const SideSheetRow(
                                                          icon: Icon(
                                                              Icons.favorite),
                                                          text: 'Wishlist',
                                                        ),
                                                      ),
                                                      textFieldGap,
                                                      textFieldGap,
                                                      GestureDetector(
                                                        onTap: () => Get.to(
                                                            const OrderPlace()),
                                                        child:
                                                            const SideSheetRow(
                                                          icon: Icon(Icons
                                                              .shopping_basket),
                                                          text: 'Order',
                                                        ),
                                                      ),
                                                      textFieldGap,
                                                      textFieldGap,
                                                      GestureDetector(
                                                        onTap: () => launchUr(
                                                            Uri.parse(
                                                                'mailto:akhilb4001@gmail.com?subject=Help me&body=need help')),
                                                        child:
                                                            const SideSheetRow(
                                                          icon: Icon(Icons
                                                              .question_answer),
                                                          text: 'Contact us',
                                                        ),
                                                      ),
                                                      textFieldGap,
                                                      textFieldGap,
                                                      Container(
                                                        color: colorWhite,
                                                        height: 49,
                                                        width: Get.width,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(10.0),
                                                          child:
                                                              Column(children: [
                                                            InkWell(
                                                              onTap: () => Get
                                                                  .defaultDialog(
                                                                middleText:
                                                                    'Do you want to Logout !!',
                                                                textConfirm:
                                                                    'Yes',
                                                                textCancel:
                                                                    'No',
                                                                onConfirm: () =>
                                                                    accountC
                                                                        .logout(),
                                                              ),
                                                              child: Row(
                                                                children: const [
                                                                  Icon(
                                                                    Icons.login,
                                                                    color:
                                                                        colorRed,
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          20),
                                                                  Text(
                                                                    'LogOut',
                                                                    style: TextStyle(
                                                                        color:
                                                                            colorRed),
                                                                  )
                                                                ],
                                                              ),
                                                            )
                                                          ]),
                                                        ),
                                                      ),
                                                       SizedBox(
                                                        height:MediaQuery.of(context).size.height*0.54 ,
                                                      ),
                                                      const Text(
                                                        'Version 1.0',
                                                        style: TextStyle(
                                                            color: colorblack),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            context: context);
                                      },
                                      icon:  Icon(Icons.menu,size: height*0.042,)),
                                  Text(
                                    'Comieo',
                                    style: textstyle,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Get.to(const SearchPage());
                                            homeC.search('');
                                            
                                          },
                                          icon:  Icon(
                                            Icons.search_outlined,
                                            color: colorblack,size: height*0.037,
                                          )),
                                      InkWell(
                                        onTap: () {
                                          Get.to(const CartScreen());
                                        },
                                        child: GetBuilder<CartController>(
                                          builder: (controller) {
                                            return
                                             badges.Badge(
                                                position: BadgePosition.topEnd(
                                                    top: 10, end: 10),
                                                badgeContent: Text(
                                                    cartController.cartList!
                                                        .products.length
                                                        .toString()),
                                                child:  Icon(Icons
                                                    .shopping_cart_outlined,size: height*0.037,));
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
                          child: ListView(children: [
                        AfterAppBar(height: height, width: width)
                      ])),
                    ],
                  ),
                ),
              );
      },
    );
  }

  Future<void> launchUr(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch ';
    }
  }
}
