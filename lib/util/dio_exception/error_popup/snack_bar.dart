

import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SnackBarPop{
  static Future<void> popUp(String text,Color color)async{
    Get.snackbar(
              text,
               "",
              //  icon: Icon(Icons.person, color: Colors.white),
               snackPosition: SnackPosition.BOTTOM,
               backgroundColor: color,
               borderRadius: 20,
               margin: EdgeInsets.all(15),
               colorText: Colors.white,
               duration: Duration(seconds: 4),
               isDismissible: true,
              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
               forwardAnimationCurve: Curves.easeOutBack,

               );
    // ScaffoldMessenger.of(context)
    // .showSnackBar(
    //  Get. SnackBar(content: Text(text,style: const TextStyle(color: colorWhite),),backgroundColor: color,duration: const Duration(seconds: 3),));
  }

}