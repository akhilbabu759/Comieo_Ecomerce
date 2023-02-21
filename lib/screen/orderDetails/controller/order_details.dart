import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/orderDetails/service/order_details.dart';
import 'package:ecomerce/screen/order_place_page.dart/controller/all_order_controller.dart';

import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  final allorderController=Get.put(AllOrderController());
  
  bool isLoading = true;
  Future<void> cancelOrder(String orderId) async {
    isLoading = true;
    update();

    await OrderDetailService().cancelOrder(orderId).then((value) {
      if (value != null) {
      
        isLoading = false;
         update();
         allorderController.getorder();
        Get.snackbar('order Cancel', 'order Canceld Successfuly',
            snackPosition: SnackPosition.BOTTOM, backgroundColor: colorRed);
            // allOrder.getorder();

       
      } else {
        isLoading = false;
        update();
      }
    });
  }
}
