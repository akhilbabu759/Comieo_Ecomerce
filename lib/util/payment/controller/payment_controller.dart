import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:ecomerce/screen/order_summery/model/order_model.dart';
import 'package:ecomerce/screen/order_summery/service/order_service.dart';





class PaymentController extends GetxController {
  Razorpay razorpay = Razorpay();
  List<Product> products = [];
  String? addressId;
  Map<String, dynamic> options = {};

  // void setAddressId(String addressid) {
  //   addressId = addressid;
  //   update();
  // }

  void setTotalAmount(amount, List<String> productIds, address) {
    log('setTotal');
    final total = "${amount * 100}";
    final amountPayable = total.toString();
    log(amountPayable);
    openCheckout(amountPayable);
    products = productIds.map((e) => Product(id: e)).toList();
    log(products.length.toString());
    addressId = address;
    log(addressId.toString());
    update();
  }

  openCheckout(amountPayable) async {
    options = {
      'key': 'rzp_test_K1qY31Ub3PKsMs',
      'amount': amountPayable,
      'name': 'Scotch',
      'description': 'Laptop',
      'prefill': {'contact': '9895709034', 'email': 'Scotch@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      razorpay.open(options);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
          (PaymentSuccessResponse response) {
        handlePaymentSuccess(response);
        orderProducts(addressId!, 'ONLINE_PAYMENT');
        update();
      });
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
          (PaymentFailureResponse response) {
        handlePaymentError(response);
      });
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
          (ExternalWalletResponse response) {
        handleExternalWallet(response);
      });
    } on PaymentFailureResponse catch (e) {
      log(e.error.toString());
    }
  }

  void handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.snackbar('payment',"SUCCESS:${response.paymentId}",backgroundColor: Colors.green,snackPosition: SnackPosition.BOTTOM );
    
    update();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar('payment',"ERROR:${response.code} - ${response.message}",backgroundColor: colorRed,snackPosition: SnackPosition.BOTTOM );
    
    update();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
     Get.snackbar('payment',"EXTERNAL_WALLET:${response.walletName}",backgroundColor: colorRed,snackPosition: SnackPosition.BOTTOM );
    
    update();
  }

  bool loading = false;
  Future<void> orderProducts(String addressId, paymentType) async {
    loading = true;
    update();
    final OrdersModel model = OrdersModel(
      addressId: addressId,
      paymentType: paymentType,
      products: products,
    );

    await OrderService().placeOrder(model).then((value) {
      if (value != null) {
        loading = false;
        update();
        Get.off(const CartScreen());
      } else {
        loading = false;
        update();
      }
    });
  }
}
