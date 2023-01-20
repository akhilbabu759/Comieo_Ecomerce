import 'dart:developer';

import 'package:ecomerce/screen/home/model/carosual_model.dart';
import 'package:ecomerce/screen/home/service/carousel_service.dart';
import 'package:get/get.dart';

class HomeControll extends GetxController{
  List<CarousalModel> carouselList=[];
    CarouselService carousalS = CarouselService();
  void getCarosel(context)async{
    await carousalS.getCarosel(context).then((value) {
      if(value!=null){
        log('add category');
        carouselList=value;
        update();
      }else {
        log('value empty');
      }
    });
  }
}