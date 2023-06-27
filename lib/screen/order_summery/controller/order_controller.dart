import 'dart:developer';

import 'package:ecomerce/screen/order_summery/model/order_model.dart';
import 'package:ecomerce/screen/order_summery/service/order_service.dart';
import 'package:get/get.dart';

class OrderCOntrollerSummery extends GetxController {
  int index = 0;

  @override
  void onInit() {
    index = 0;
    update();
    super.onInit();
  }

  void indexChange(value) {
    index = value;
    update();
  }
 Future< void> orderPlace(OrdersModel model)async{

  await OrderService().placeOrder(model).then((value) {
    if(value !=null){
      log('orderplaced successful');
    }
    return ;
  });


 }
}
