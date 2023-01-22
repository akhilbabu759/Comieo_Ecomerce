import 'dart:developer';

import 'package:ecomerce/screen/home/model/carosual_model.dart';
import 'package:ecomerce/screen/home/service/carousel_service.dart';
import 'package:get/get.dart';

class HomeControll extends GetxController {
  HomeControll() {
    log('contsrtuct');
    getCarosel();
  }
  List<CarousalModel> carouselList = [];
  CarouselService carousalS = CarouselService();
    bool isLoding = false;
  void getCarosel() async {
    isLoding = false;
    log('get call');
    await carousalS.getCarosel().then((value) {
      log(value.toString());
      if (value != null) {
        log('carousel list get');
        carouselList = value;
        isLoding = false;
        update();
      } else {
        isLoding = false;
        update();
        log('value empty');
      }
    });
    isLoding = false;
    update();
  }
}
