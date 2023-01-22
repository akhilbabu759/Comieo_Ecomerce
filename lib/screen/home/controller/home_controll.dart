import 'dart:developer';

import 'package:ecomerce/screen/home/model/carosual_model.dart';
import 'package:ecomerce/screen/home/model/category_model.dart';
import 'package:ecomerce/screen/home/service/carousel_service.dart';
import 'package:ecomerce/screen/home/service/category_service.dart';
import 'package:get/get.dart';

class HomeControll extends GetxController {
  HomeControll() {
    log('contsrtuct');
    getCarosel();
    getCategory();
  }
  List<CarousalModel> carouselList = [];
  List<CategoryModel> categorylList = [];
  CarouselService carousalS = CarouselService();
  CategoryService categoryService = CategoryService();
  bool isLoding = false;
  void getCategory() async {
    await categoryService.getCategory().then((value) {
      log(value.toString());
      if (value != null) {
        log('carousel list get');
        categorylList = value;
        update();
        isLoding = false;
        update();
      } else {
        isLoding = true;
        update();
        log('value empty');
      }
    });
    isLoding = false;
    update();
  }

  void getCarosel() async {
    isLoding = false;
    log('get call');
    await carousalS.getCarosel().then((value) {
      log(value.toString());
      if (value != null) {
        log('carousel list get');
        carouselList = value;
        update();
        isLoding = false;
        update();
      } else {
        isLoding = true;
        update();
        log('value empty');
      }
    });
    isLoding = false;
    update();
  }
}
