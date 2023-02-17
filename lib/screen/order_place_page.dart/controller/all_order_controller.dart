import 'dart:developer';

import 'package:ecomerce/screen/order_place_page.dart/model/all_order_deateals.dart';
import 'package:ecomerce/screen/order_place_page.dart/service/all_order_service.dart';

import 'package:get/get.dart';

class AllOrderController extends GetxController{
  bool isLoding=true;

  @override
  void onInit() {
     log('contsrtuct');
    getorder();
    
    
    
    super.onInit();
  }
  
  List<AllOrder> orderList=[];
  void getorder()async{
     isLoding=true;
     update();
    await AllOrderService().getOrder().then((value) {
     if(value!=null){
      orderList=value;
      log(orderList[0].products[0].discountPrice.toString());
       isLoding=false;
       update();

     }else{
      return null;
     }
    });
  }

}

