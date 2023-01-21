import 'dart:developer';

import 'package:ecomerce/screen/auth/signup/view/signup.dart';
import 'package:ecomerce/screen/bottom_navigator/controller/bottom_controller.dart';
import 'package:ecomerce/screen/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class BottomNavigator extends StatelessWidget {
  BottomController signupController = Get.put(BottomController());
  BottomNavigator({super.key});
  // final page = [
  //   const Home(),
  //   SignupPage()

  // ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetBuilder<BottomController>(
        builder: (controller) => BottomNavigationBar(
            unselectedItemColor: Colors.white,
            backgroundColor: const Color.fromARGB(210, 22, 27, 35),
            onTap: (value) async {
              controller.indexChange(value);

              log(signupController.selectedIndex.toString());

              // selectedIndex.notifyListeners();},
            },
            currentIndex: signupController.selectedIndex,
            selectedItemColor: const Color.fromARGB(255, 7, 255, 255),
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Category', icon: Icon(Icons.category)),
              BottomNavigationBarItem(
                  label: 'Settings', icon: Icon(Icons.settings))
            ]),
      ),
    );
  }
}
