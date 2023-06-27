import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/widget/one_product_details.dart';
import 'package:ecomerce/screen/order_summery/view/order_summery.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    return GetBuilder<CartController>(
      builder: (controller) {
        return cartcontrol.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(
                  color: colorWhite,
                  backgroundColor: Colors.cyan,
                ),
              )
            : Scaffold(
                bottomNavigationBar: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  height: 97,
                  decoration: BoxDecoration(
                      color: Colors.blueGrey.shade300,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, -1),
                            blurRadius: 20,
                            color: const Color.fromARGB(255, 99, 98, 98)
                                .withOpacity(0.15))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 1,
                        ),
                        GetBuilder<CartController>(
                          builder: (controller) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "  ₹ ${cartcontrol.cartList!.totalPrice}  ",
                                  style: const TextStyle(
                                      fontSize: 38, color: colorblack),
                                ),
                                GestureDetector(
                                  onTap: () => Get.to(const OrderSummery(
                                    page: 0,
                                  )),
                                  child: Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width*0.36,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.orange[700],
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Check out',
                                        style: TextStyle(
                                            color: colorWhite,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      ],
                    ),
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
                  title: const Column(children: [
                    Text(
                      "My Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                  ]),
                ),
                body: SafeArea(
                    child: Column(
                  children: [
                    textFieldGap,
                    Expanded(
                      child: GetBuilder<CartController>(
                        builder: (controller) {
                          return controller.cartList!.products.isEmpty
                              ? const Center(child: Text('Cart is empty'))
                              : ListView.builder(
                                  itemCount:
                                      controller.cartList!.products.length,
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: OneProduct(
                                      index: index,
                                    ),
                                  ),
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
