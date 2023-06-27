import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';

import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/order_summery/view/widget/before_bottom.dart';
import 'package:ecomerce/screen/order_summery/view/widget/product_deatails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.cartcontrol, required this.page})
      : super(key: key);
  final int page;

  final CartController cartcontrol;

  @override
  Widget build(BuildContext context) {
    final adrres = Get.put(AcountController());
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          BeforeBottom(cartcontrol: cartcontrol),
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: page == 1 ? 1 : cartcontrol.cartList!.products.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: ProductDeatails(index: index, page: page),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textFieldGap,
                const Text(
                  'Price Details',
                  style: TextStyle(fontSize: 22),
                ),
                textFieldGap,
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Price',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500)),
                      Text(
                        page == 1
                            ? '₹${adrres.model.price}'
                            : '₹${cartcontrol.cartList!.totalPrice}',
                        style: const TextStyle(
                            color: colorblack,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    ]),
                textFieldGap,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Delivery Charge',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Free Delivery',
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    )
                  ],
                ),
                textFieldGap,
                Divider(
                  color: Colors.grey.shade200,
                  height: 1.5,
                  thickness: 1,
                ),
                textFieldGap,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total Amount',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                        page == 1
                            ? '₹${adrres.model.price}'
                            : '₹${cartcontrol.cartList!.totalPrice}',
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500))
                  ],
                ),
                const SizedBox(
                  height: 65,
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
