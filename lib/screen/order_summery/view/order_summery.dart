import 'dart:ui';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/order_summery/view/widget/addrees_container.dart';
import 'package:ecomerce/screen/order_summery/view/widget/before_bottom.dart';
import 'package:ecomerce/screen/order_summery/view/widget/body.dart';
import 'package:ecomerce/screen/order_summery/view/widget/product_deatails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: colorWhite,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios,
                color: colorblack,
              ),),
          title: const Text(
            'Order Summary',
            style: TextStyle(color: colorblack, fontSize: 20),
          ),),
      body: Stack(
        children: [
          Body(cartcontrol: cartcontrol),
          Positioned(bottom: Get.height*0,
            child: Container(width: Get.width,
              color: Colors.blueGrey[50],
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                const Padding(
                  padding:  EdgeInsets.only(left:30.0),
                  child:  Text('₹16378',style: TextStyle(fontSize: 19,fontWeight: FontWeight.w500,),),
                ),
                Padding(
                  padding:  const EdgeInsets.only(right:8.0),
                  child: ElevatedButton(style: ButtonStyle(shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
      // side: BorderSide(color: Colors.red)
    )
  ),
                    minimumSize:MaterialStateProperty.all(Size(Get.width*0.4, Get.height*0.05)) ,
                    backgroundColor:MaterialStateProperty.all(Colors.yellow.shade600) ),
                    onPressed:  () {
                    
                  }, child: const Text('Continue',style: TextStyle(color: colorblack,fontSize: 16),)),
                )
              ],),
            ),
            ),)
        ],
      ),
      
      
    );
  }
}

