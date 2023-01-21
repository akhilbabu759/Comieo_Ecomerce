import 'dart:developer';

import 'package:ecomerce/screen/home/model/carosual_model.dart';
import 'package:ecomerce/screen/home/service/carousel_service.dart';
import 'package:get/get.dart';

class HomeControll extends GetxController {
  HomeControll(context) {
    log('contsrtuct');
    getCarosel(context);
  }
  List<CarousalModel> carouselList = [];
  CarouselService carousalS = CarouselService();
  void getCarosel(context) async {
    log('get call');
    await carousalS.getCarosel(context).then((value) {
      log(value.toString());
      if (value != null) {
        log('carousel list get');
        carouselList = value;
        update();
      } else {
        log('value empty');
      }
    });
  }
}
