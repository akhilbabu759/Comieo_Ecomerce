import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderPlace extends StatelessWidget {
  const OrderPlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorWhite,
        leading: IconButton(onPressed: () => Get.back(),
          icon: 
           const Icon(
            Icons.arrow_back_ios,
            color: colorblack,
          ),
        ),
        title: const Text(
          "My Orders",
          style: TextStyle(
              color: colorblack, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        actions:  [
           IconButton(onPressed:() =>Get.to(const CartScreen()) ,
            icon: const Icon(
            Icons.shopping_cart,
            color: colorblack,)
          ),SizedBox(width: Get.width*0.02,),
        ],
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                  ),
                  child: Container(
                    height: 120,
                    width: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://rukminim1.flixcart.com/image/832/832/xif0q/mobile/m/o/b/-original-imaghx9qkugtbfrn.jpeg?q=70'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17.0, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'APPLE iphone 14(Blue,128GB)',
                        style: TextStyle(color: colorblack, fontSize: 20),
                      ),
                      textFieldGap,
                      Text(
                        'Delivery Cancelled on 2023-02-14 ',
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              height: 25,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
