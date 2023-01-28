import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/bottom_navigator/controller/bottom_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BottomNavigator extends StatelessWidget {
  const BottomNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    BottomController signupController = Get.put(BottomController());
    return Material(
      child: GetBuilder<BottomController>(
        builder: (controller) => BottomNavigationBar(
            unselectedItemColor: Colors.white,
            backgroundColor: backgroundColorBlack,
            onTap: (value) async {
              controller.indexChange(value);

              log(signupController.selectedIndex.toString());

              // selectedIndex.notifyListeners();},
            },
            currentIndex: signupController.selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
            items: const [
              BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(
                    Icons.home,
                  )),
              BottomNavigationBarItem(
                  label: 'Category',
                  icon: Icon(
                    Icons.category,
                  )),
              BottomNavigationBarItem(
                  label: 'Account',
                  icon: Icon(
                    Icons.account_circle_outlined,
                  )),
              BottomNavigationBarItem(
                  label: 'Cart',
                  icon: Icon(
                    Icons.home,
                  ))
            ]),
      ),
    );
  }
}
