import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/widget/one_product_details.dart';
import 'package:ecomerce/screen/cart/view/widget/one_row_product.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    return  GetBuilder<CartController>(builder: (controller) {
      return cartcontrol.isLoading.value==true?const Center(
                    child: CircularProgressIndicator(
                      color: colorWhite,
                      backgroundColor: Colors.cyan,
                    ),
                  ): Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
          height: 174,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, -1),
                    blurRadius: 20,
                    color: const Color(0xFFDADADA).withOpacity(0.15))
              ]),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F6F9),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                        'https://static.vecteezy.com/system/resources/previews/013/374/462/original/bill-icon-style-free-vector.jpg'),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GetBuilder<CartController>(
                builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(TextSpan(text: 'Total:\n', children: [
                        TextSpan(
                            text: "${cartcontrol.cartList!.totalPrice}",
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black))
                      ])),
                      Container(
                        height: 50,
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color: Colors.orange[700],
                        ),
                        padding: const EdgeInsets.only(left: 40, top: 15),
                        child: const Text(
                          'Check out',
                          style: TextStyle(color: colorWhite),
                        ),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Column(children: [
            const Text(
              "My Cart",
              style: TextStyle(color: Colors.black),
            ),
            // GetBuilder<CartController>(builder: (controller) {
            //   return Text("${cartcontrol.totalproductCount} items",
            //       style: const TextStyle(
            //         color: Colors.black54,
            //       ));
            // })
          ]),
        ),
        body: SafeArea(
            child: Column(
          children: [textFieldGap,
           
            Expanded(
              child: GetBuilder<CartController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.cartList!.products.length,
                    itemBuilder: (context, index) => 
                     OneProduct(index: index,),
                  );
                },
              ),
            ),
          ],
        )),
      );
    },
    );
  }
}
