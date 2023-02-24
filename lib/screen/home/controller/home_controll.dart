import 'dart:developer';

import 'package:ecomerce/screen/home/model/carosual_model.dart';
import 'package:ecomerce/screen/home/model/category_model.dart';
import 'package:ecomerce/screen/home/model/product_model.dart';

import 'package:ecomerce/screen/home/service/carousel_service.dart';
import 'package:ecomerce/screen/home/service/category_service.dart';
import 'package:ecomerce/screen/home/service/product_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeControll extends GetxController {
  @override
  void onInit() {
    log('contsrtuct');
    getCarosel();
    getCategory();
    getProduct();
    search( '');

    super.onInit();
  }

  List<CarousalModel> carouselList = [];
  List<CategoryModel> categorylList = [];
  List<ProductModel> productList = [];
  CarouselService carousalS = CarouselService();
  CategoryService categoryService = CategoryService();
  ProductService productService = ProductService();
  bool isLoding = true;
  List<ProductModel> searchResult = [];
  TextEditingController searchController = TextEditingController();

  void getProduct() async {
    isLoding = true;
    update();
    await productService.getProduct().then((value) {
      log(value.toString());
      if (value != null) {
        log('carousel list get');
        productList = value;
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

  void getCategory() async {
    isLoding = true;
    update();
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

  void search(String keyboard) {
    isLoding=true;
    update();
    List<ProductModel> results = [];
    if (keyboard.isEmpty) {
      results = productList;
    } else {
      results = productList
          .where(
            (element) => element.name.toLowerCase().contains(
                  keyboard.toLowerCase(),
                ),
          )
          .toList();
          update();
    }
    // log(results[0].name);

    searchResult = results;
    update();
     isLoding=false;
    update();
  }
}
