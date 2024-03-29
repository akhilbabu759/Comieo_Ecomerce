import 'dart:developer';

import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

class OneProduct extends StatelessWidget {
  const OneProduct({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    return Card(
      child: Column(children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.network(
            '${ApiBaseUrl().baseurl}/products/${cartcontrol.reversedProcuct[index].product.image[0]}',
            height: 150,
            width: MediaQuery.of(context).size.width*0.368,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: Get.size.width * 0.440),
                child: IconButton(
                    onPressed: () {
                      Get.defaultDialog(
                          title: 'Remove Item',
                          middleText: 'Are you sure, Do you want to remove this item?',
                          onConfirm: () {
                            cartcontrol.removeCart(
                                cartcontrol.reversedProcuct[index].product.id);
                            Get.back();
                          },
                          textConfirm: 'Yes',
                          textCancel: 'No');
                    },
                    icon: const Icon(Icons.dangerous)),
              ),
              Text(
                cartcontrol.reversedProcuct[index].product.name,
                style: const TextStyle(
                  fontSize: 21,
                ),
                maxLines: 2,
              ),
              textFieldGap,
              RatingBar.builder(
                initialRating: double.parse(
                    cartcontrol.reversedProcuct[index].product.rating),
                itemSize: 15,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                ignoreGestures: true,
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (startRating) {},
              ),
              textFieldGap,
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text:
                        '₹${cartcontrol.reversedProcuct[index].product.offer}',
                    style: const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color.fromARGB(255, 112, 114, 115),
                        fontSize: 15)),
                TextSpan(
                    text:
                        ' ₹${cartcontrol.reversedProcuct[index].product.price}',
                    style: const TextStyle(color: Colors.black, fontSize: 20)),
                TextSpan(
                    text:
                        ' ${cartcontrol.reversedProcuct[index].product.discountPrice}% off',
                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ))
              ])),
              textFieldGap,
              RichText(
                  text: const TextSpan(children: [
                TextSpan(
                    text: ' Delivery in 4 days |',
                    style: TextStyle(
                        color: Color.fromARGB(
                          255,
                          112,
                          114,
                          115,
                        ),
                        fontSize: 12)),
                TextSpan(
                    text: ' Free delivery',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                    )),
              ])),
            ],
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(right: 87),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Card(
                  elevation: 3,
                  child: Row(
                    children: [
                      Card(
                        elevation: 3,
                        child: ColoredBox(
                          color: Colors.grey,
                          child: GestureDetector(
                              child: const Icon(Icons.remove, size: 30),
                              onTap: () {
                                cartcontrol.incrementDecrementQty(
                                    -1,
                                    cartcontrol
                                        .reversedProcuct[index].product.id,
                                    cartcontrol.reversedProcuct[index].qty,
                                    cartcontrol
                                        .reversedProcuct[index].product.size[0]
                                        .toString());
                                log(
                                    cartcontrol
                                        .reversedProcuct[index].product.size[0],
                                    name: 'size check');
                              }),
                        ),
                      ),
                      GetBuilder<CartController>(
                        builder: (controller) {
                          return SizedBox(
                              width: 20,
                              height: 24,
                              child: Center(
                                child: Text(
                                  cartcontrol.reversedProcuct[index].qty
                                      .toString(),
                                  style: const TextStyle(fontSize: 17),
                                ),
                              ));
                        },
                      ),
                      Card(
                        elevation: 3,
                        child: ColoredBox(
                          color: Colors.grey,
                          child: GestureDetector(
                              child: const Icon(Icons.add, size: 30),
                              onTap: () {
                                cartcontrol.incrementDecrementQty(
                                    1,
                                    cartcontrol
                                        .reversedProcuct[index].product.id,
                                    cartcontrol.reversedProcuct[index].qty,
                                    cartcontrol
                                        .reversedProcuct[index].product.size[0]
                                        .toString());
                                log(
                                    cartcontrol
                                        .reversedProcuct[index].product.size[0],
                                    name: 'size check');
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Card(
                elevation: 3,
                child: SizedBox(
                  height: 27,
                  child: Center(
                      child: Text(
                    '  See more like this  ',
                    style: TextStyle(fontSize: 13),
                  )),
                ),
              )
            ],
          ),
        ),
        textFieldGap
      ]),
    );
  }
}
