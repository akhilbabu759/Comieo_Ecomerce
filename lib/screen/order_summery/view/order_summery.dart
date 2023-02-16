

import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';

import 'package:ecomerce/screen/order_summery/view/widget/body.dart';

import 'package:ecomerce/util/payment/controller/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OrderSummery extends StatefulWidget {
   const OrderSummery({super.key,});
 

  @override
  State<OrderSummery> createState() => _OrderSummeryState();
}

class _OrderSummeryState extends State<OrderSummery> {
  PaymentController paymentController = PaymentController();
   @override
  void initState() {
    final razorpay = paymentController.razorpay;
    razorpay.on(
        Razorpay.EVENT_PAYMENT_SUCCESS, paymentController.handlePaymentSuccess);
    razorpay.on(
        Razorpay.EVENT_PAYMENT_ERROR, paymentController.handlePaymentError);
    razorpay.on(
        Razorpay.EVENT_EXTERNAL_WALLET, paymentController.handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    paymentController.razorpay.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cartcontrol = Get.put(CartController());
    final adrres = Get.put(AcountController());
    
    return GetBuilder<AcountController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorWhite,
          leading: IconButton(
            onPressed: () {Get.back();},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: colorblack,
            ),
          ),
          title: const Text(
            'Order Summary',
            style: TextStyle(color: colorblack, fontSize: 20),
          ),
        ),
        body: Stack(
          children: [
            Body(cartcontrol: cartcontrol),
            Positioned(
              bottom: Get.height * 0,
              child: Container(
                width: Get.width,
                color: Colors.blueGrey[50],
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                          '₹${cartcontrol.totalSave}',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  // side: BorderSide(color: Colors.red)
                                )),
                                minimumSize: MaterialStateProperty.all(
                                    Size(Get.width * 0.4, Get.height * 0.05)),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.yellow.shade600)),
                            onPressed: () {
                              
                              paymentController.setTotalAmount(
                                 cartcontrol.cartList!.totalDiscount,
                                  cartcontrol.cartList!.products,
                                  adrres.addressList[0].id);
                            }
                            
                            ,
                            child: const Text(
                              'Continue',
                              style: TextStyle(color: colorblack, fontSize: 16),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    },
    );
  }
}
