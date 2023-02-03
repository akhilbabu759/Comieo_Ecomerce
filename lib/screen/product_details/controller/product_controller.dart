import 'dart:developer';

import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  Color cole1 = Color.fromARGB(255, 236, 113, 154);
  Color cole2 = colorWhite;
  int size = 0;
  void onSizeSelected(int index) {
    if (index == 1) {
      cole1 = colorWhite;
      cole2 = Color.fromARGB(255, 224, 120, 155);
    } else {
      cole1 = Color.fromARGB(255, 213, 109, 144);
      cole2 = colorWhite;
    }
    log('select size', name: 'size select');
    size = index;
    update();

    log(size.toString(), name: 'size update');
  }
}
