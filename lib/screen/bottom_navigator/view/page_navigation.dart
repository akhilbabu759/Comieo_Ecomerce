import 'package:ecomerce/screen/auth/signup/view/signup.dart';
import 'package:ecomerce/screen/bottom_navigator/controller/bottom_controller.dart';
import 'package:ecomerce/screen/bottom_navigator/view/bottom_navigator.dart';
import 'package:ecomerce/screen/home/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ScreenMAinPage extends StatelessWidget {
  ScreenMAinPage({super.key});
  final page = [
    const Home(),
    SignupPage()
    
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomController>(
       
          builder:(controller) {
            
         
            return page[controller.selectedIndex];
          }),
      bottomNavigationBar:  BottomNavigator(),
    );
  }
}