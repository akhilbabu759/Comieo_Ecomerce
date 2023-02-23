import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/model/get_cart_model.dart';

import 'package:ecomerce/screen/order_place_page.dart/view/order_place.dart';
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
  final cartcotro = Get.put(CartController());

  void setTotalAmount(
      int amount, List<ProductElement> productsList, address, int page) {
    log('setTotal');
    final total = "${amount * 100}";
    final amountPayable = total.toString();
    update();
    products = productsList.map((e) => Product(id: e.id)).toList();
    update();

    log(amountPayable);
    openCheckout(amountPayable);

    log(products.length.toString());
    log(products[0].id.toString());
    addressId = address;
    update();
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
    Get.snackbar('payment', "SUCCESS:${response.paymentId}",
        backgroundColor: Colors.green, snackPosition: SnackPosition.BOTTOM);

    update();
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Get.snackbar('payment', "ERROR:${response.code} - ${response.message}",
        backgroundColor: colorRed, snackPosition: SnackPosition.BOTTOM);

    update();
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Get.snackbar('payment', "EXTERNAL_WALLET:${response.walletName}",
        backgroundColor: colorRed, snackPosition: SnackPosition.BOTTOM);

    update();
  }

  bool loading = false;
  Future<void> orderProducts(String addressId, paymentType) async {
    log(addressId);
    log(paymentType);
    log(products[0].id);

    loading = true;
    update();
    final OrdersModel model = OrdersModel(
        addressId: addressId, paymentType: paymentType, products: products);
    log(addressId);
    log(paymentType);
    log(products[0].id);

    await OrderService().placeOrder(model).then((value) {
      if (value != null) {
        loading = false;
        update();

        Get.off(const OrderPlace());
        cartcotro.getCart();
        Get.snackbar('Order Placed', 'Order placed succefully',
            backgroundColor: Colors.green,
            colorText: colorblack,
            snackPosition: SnackPosition.BOTTOM);
      } else {
        loading = false;
        update();
      }
    });
  }
}
