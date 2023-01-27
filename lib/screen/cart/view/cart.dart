import 'dart:ui';

import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/widget/one_row_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 30,
        ),
        height: 174,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, -1),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15))
            ]),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Image.network('https://static.vecteezy.com/system/resources/previews/013/374/462/original/bill-icon-style-free-vector.jpg'),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(TextSpan(text: 'Total:\n', children: [
                  TextSpan(
                      text: ""+cartcontrol.cartList!.totalPrice.toString(),
                      style: TextStyle(fontSize: 16, color: Colors.black))
                ])),
                Container(
                  height: 50,
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Colors.orange[700],
                  ),
                  child: Text(
                    'Check out',
                    style: TextStyle(color: colorWhite),
                  ),
                  padding: EdgeInsets.only(left: 40, top: 15),
                )
              ],
            )
          ],
        ),
      ),
      appBar: AppBar(leading: IconButton(onPressed: () => Get.back(),icon: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title:
         Column(children:  [
          Text(
            "My Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text( cartcontrol.totalproductCount.toString()+" items", style: TextStyle(color: Colors.black54))
        ]),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.cartList!.products.length,
                itemBuilder: (context, index) => RowCart(index: index,),
              );
            },
            ),
          ),
        ],
      )),
    );
  }
}
