import 'dart:developer';

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
            unselectedItemColor: Colors.black,
            
            onTap: (value) async {
              controller.indexChange(value);

              log(signupController.selectedIndex.toString());

            
            },
            currentIndex: signupController.selectedIndex.value.toInt(),
            selectedItemColor: Colors.blue,
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
                  label: 'Settings',
                  icon: Icon(
                    Icons.settings,
                  ))
            ]),
      ),
    );
  }
}
