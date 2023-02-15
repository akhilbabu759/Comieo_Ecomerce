import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/account/account_main/view/account.dart';
import 'package:ecomerce/screen/auth/signup/view/signup.dart';
import 'package:ecomerce/screen/bottom_navigator/controller/bottom_controller.dart';
import 'package:ecomerce/screen/bottom_navigator/view/bottom_navigator.dart';
import 'package:ecomerce/screen/category/view/category.dart';
import 'package:ecomerce/screen/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenMAinPage extends StatelessWidget {
  ScreenMAinPage({super.key});
  final page = [
    const Home(),
    const CategoryPage(),
    const Account()
  ];
  @override
  Widget build(BuildContext context) {
    BottomController signupController = Get.put(BottomController());
    return Scaffold(
      backgroundColor: colorWhite,
      body: GetBuilder<BottomController>(builder: (controller) {
        return  Obx(() => page[signupController.selectedIndex.value.toInt()]);
      }),
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}
