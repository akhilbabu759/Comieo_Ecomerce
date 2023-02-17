import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/order_place_page.dart/controller/all_order_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderPlace extends StatelessWidget {
  const OrderPlace({super.key});

  @override
  Widget build(BuildContext context) {
    final orderC=Get.put(AllOrderController());
    return GetBuilder<AllOrderController>(builder: (controller) {
      return orderC.isLoding==true?const Center(
                child: CircularProgressIndicator(
                  color: colorWhite,
                  backgroundColor: Colors.cyan,
                ),
              ): Scaffold(
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
        itemCount: orderC.orderList.length,
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
                    height: 100,
                    width: 100,
                    decoration:  BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            '${ApiBaseUrl().baseurl}/products/${orderC.orderList[index].products[0].product.image[0]}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 17.0, left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        orderC.orderList[index].products[0].product.name,
                        
                        style: const TextStyle(color: colorblack, fontSize: 20),
                      ),
                      textFieldGap,
                       Text('Delivery Cancelled on'+
                        orderC.orderList[index].deliveryDate.day.toString()
                        ,
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
      ),);
    }
    );
  }
}