import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/orderDetails/service/order_details.dart';
import 'package:ecomerce/screen/order_summery/service/order_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  bool isLoading = true;
  Future<void> cancelOrder(String orderId) async {
    isLoading = true;
    update();

    await OrderDetailService().cancelOrder(orderId).then((value) {
      if (value != null) {
        isLoading = false;
        Get.snackbar('order Cancel', 'order Canceld Successfuly',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: colorRed);

        update();
      } else {
        isLoading = false;
        update();
      }
    });
  }
}
