import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:ecomerce/screen/home/view/widget/afterAppBar/after_appbar.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/list_card.dart';
import 'package:ecomerce/screen/home/view/widget/carousel_slider/carousel.dart';
import 'package:ecomerce/screen/home/view/widget/heding/heding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:side_sheet/side_sheet.dart';

import 'widget/home_grideviewe/grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});
 
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
    final double width = size.width;
    return Scaffold(
      
                        

      
      
      // bottomNavigationBar: BottomNavigator(),
      backgroundColor:Colors.blueGrey[50],

      
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container( decoration:BoxDecoration(color: colorWhite,backgroundBlendMode:BlendMode.hardLight ,
                borderRadius: BorderRadius.circular(20)) ,
                // color: Colors.white,
              height: height*0.13,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  // SizedBox(width: width*0.04),
                    Text(
                            'Comieo',
                            style: textstyle,
                          ),
                          Row(
                            children: [
                            IconButton(onPressed: () {
                              
                            }, icon:const Icon( Icons.search,color:colorblack,)),
                             IconButton(onPressed: () {
                               
                             }, icon: const Icon( Icons.favorite,color: colorblack,))
                          ],)
                ]),
              ),
          ),
            ),
            Expanded(child: ListView(children:[ AfterAppBar(height: height, width: width)])),
          ],
        ),
      ),
      // child: Text('home')),
    );
  }
}

