import 'dart:developer';

import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/orderDetails/controller/order_details.dart';
import 'package:ecomerce/screen/order_place_page.dart/model/all_order_deateals.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:share/share.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.model, required this.index});
  final AllOrder model;
  final int index;

  @override
  Widget build(BuildContext context) {
    final ordeCanceController = Get.put(OrderDetailsController());
    log(model.orderStatus);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorWhite,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: colorblack,
          ),
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: colorblack, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              width: Get.width,
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  children: [
                    Text(
                      'Order ID - ${model.id}',
                      style: const TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(thickness: 2, height: 0),
            Container(
              color: colorWhite,
              height: 150,
              width: Get.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.products[0].product.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                          textFieldGap,
                          Text(
                            'quantity ${model.products[0].qty}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          textFieldGap,
                          Text(
                            '₹ ${model.products[0].product.price}',
                            style: const TextStyle(
                                fontSize: 22,
                                color: colorblack,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Container(
                        height: 120,
                        width: 100,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                '${ApiBaseUrl().baseurl}/products/${model.products[0].product.image[0]}'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(thickness: 2, height: 0),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.verified_rounded,
                        color: Colors.green,
                        size: 28,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      RichText(
                        text: TextSpan(
                          text: "Order confirmed\n",
                          style:
                              const TextStyle(fontSize: 18, color: colorblack),
                          children: [
                            TextSpan(
                                text:
                                    '${model.orderDate.day}/${model.orderDate.month}/${model.orderDate.year}',
                                style: const TextStyle(fontSize: 17))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, left: 20),
                  child: model.orderStatus == 'CANCELED'
                      ? Row(
                          children: [
                            SizedBox(
                              width: 6,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: colorRed,
                            ),
                            // Icon(
                            //   Icons.verified_rounded,
                            //   color: Colors.red,
                            //   size: 28,
                            // ),
                            SizedBox(
                              width: 15,
                            ),
                            RichText(
                              text: TextSpan(
                                text: "Order Cancelled\n",
                                style: const TextStyle(
                                    fontSize: 18, color: colorblack),
                                children: [
                                  TextSpan(
                                      text:
                                          '${model.cancelDate.toString().substring(8, 10)}/${model.cancelDate.toString().substring(6, 8)}/${model.cancelDate.toString().substring(0, 4)}',
                                      // model.cancelDate.toString().substring(, 10),

                                      // '${model.cancelDate}',
                                      style: const TextStyle(fontSize: 17))
                                ],
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: const [
                            Icon(
                              Icons.radio_button_off,
                              color: Colors.grey,
                              size: 28,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Order Shipped',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 18),
                            ),
                          ],
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                model.orderStatus == 'CANCELED'
                    ? const Text('')
                    : Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 20),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.radio_button_off,
                                  color: Colors.grey,
                                  size: 28,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  'Order Delivered',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          textFieldGap,
                          textFieldGap,
                          textFieldGap,
                        ],
                      ),
              ],
            ),
            Container(
              width: Get.width,
              height: 70,
              color: Colors.grey.shade300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.defaultDialog(
                        onConfirm: () {
                          ordeCanceController.cancelOrder(model.id);
                          Get.back();
                        },
                        textConfirm: 'Yes',
                        title: 'Do you want to cancel',
                        textCancel: 'No',
                        // onCancel: () =>Get.back() ,
                      );
                    },
                    child: Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 19, color: Colors.grey.shade700),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Share.share(
                        'https://play.google.com/store/apps/details?id=com.',
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(Icons.share),
                        const SizedBox(
                          width: 9,
                        ),
                        Text('Share Order Details',
                            style: TextStyle(
                                fontSize: 19, color: Colors.grey.shade700))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: Get.width,
              height: 45,
              color: Colors.grey.shade200,
              child: const Padding(
                padding: EdgeInsets.only(left: 14.0, top: 13),
                child: Text('Shopping Details'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 15),
              child: RichText(
                text: TextSpan(
                  text: "${model.fullName}\n",
                  style: const TextStyle(fontSize: 18, color: colorblack),
                  children: [
                    TextSpan(
                        text: '${model.place}\n',
                        style: TextStyle(fontSize: 17)),
                    TextSpan(
                        text: '${model.landMark}\n',
                        style: TextStyle(fontSize: 17)),
                    TextSpan(
                        text: model.state + ':-' + model.pin,
                        style: TextStyle(fontSize: 17)),
                    TextSpan(
                        text: '\nPhone Number:-' + model.phone,
                        style: TextStyle(fontSize: 17))
                  ],
                ),
              ),
            ),
            textFieldGap,
            textFieldGap
          ],
        ),
      ),
    );
  }
}
