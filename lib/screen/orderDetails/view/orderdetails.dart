import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/order_place_page.dart/model/all_order_deateals.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key,required this.model});
  final AllOrder model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: colorWhite,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: colorblack,
        ),
        title: const Text(
          "Order Details",
          style: TextStyle(
              color: colorblack, fontSize: 25, fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: Get.width,
            color: Colors.grey.shade200,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: const [
                  Text(
                    'Order ID - 63e333d1586gvdfhdabkadjhg7651j9',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          const Divider(thickness: 2, height: 0),
          Container(
            color: Colors.grey.shade200,
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
                      children: const [
                        Text(
                          "Nothing Phone (1)",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        textFieldGap,
                        Text(
                          '8 GB RAM',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        textFieldGap,
                        Text(
                          '₹26979',
                          style: TextStyle(
                              fontSize: 22,
                              color: colorblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
          ),
          const Divider(thickness: 2, height: 0),
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
                  text: const TextSpan(
                    text: "Order confirmed\n",
                    style: TextStyle(fontSize: 18, color: colorblack),
                    children: [
                      TextSpan(
                          text: "2023-02-14 05:27:45",
                          style: TextStyle(fontSize: 17))
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
                  'Order Shipped',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
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
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
          textFieldGap,
          textFieldGap,
          textFieldGap,
          Container(
            width: Get.width,
            height: 70,
            color: Colors.grey.shade300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Cancel',
                  style: TextStyle(fontSize: 19, color: Colors.grey.shade700),
                ),
                Row(
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
              ],
            ),
          ),
          Container(
            width: Get.width,
            height: 45,
            color: Colors.grey.shade200,
            child: const Padding(
              padding: EdgeInsets.only(left:14.0,top: 13),
              child: Text('Shopping Details'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10.0,left: 15),
            child: RichText(
                    text: const TextSpan(
                      text: "AkhilBabu\n",
                      style: TextStyle(fontSize: 18, color: colorblack),
                      children: [
                        TextSpan(
                            text: "2023-02-14 05:27:45",
                            style: TextStyle(fontSize: 17))
                      ],
                    ),
                  ),
          ),
          
        ],
      ),
    );
  }
}
