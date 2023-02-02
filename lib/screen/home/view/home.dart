import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';

import 'package:ecomerce/screen/Whishlist/view/wishlist.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
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
                                          padding: const EdgeInsets.only(top:63.0,left: 10),
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                            Text('Welcome,',style: TextStyle(color: colorWhite,fontSize: 20),),
                                            // IconButton(
                                            //     onPressed: () {},
                                            //     icon: const Icon(
                                            //       Icons.account_circle_outlined,
                                            //       size: 36,color: colorWhite,
                                            //     )),
                                    
                                            Row(
                                              children: const [
                                                Icon(Icons.person,color: Colors.white,),
                                                SizedBox(width: 10,),
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
                                       GestureDetector(onTap: () => Get.to(const WishList()) , child: const SideSheetRow(icon:  Icon(Icons.favorite),text: 'Wishlist',)),
                                      
                                       textFieldGap,
                                       GestureDetector(onTap: () => Get.to('') , child: const SideSheetRow(icon:  Icon(Icons.account_circle),text: 'Account',)),
                                      
                                       textFieldGap,
                                       GestureDetector(child: const SideSheetRow(icon:  Icon(Icons.shopping_basket),text: 'Order',)),
               
                                      textFieldGap,
                                       GestureDetector(
                                         child: const SideSheetRow(icon:  Icon(Icons.question_answer),text: 'Contact us',),
                                       ),
                                       textFieldGap,
                                       GestureDetector(child: const SideSheetRow(icon:  Icon(Icons.help_center),text: 'Help',)),
                                       const SizedBox(height: 300,),
                                       const Text('Version 1.0',style: TextStyle(color: colorblack),)
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

