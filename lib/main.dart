
import 'package:ecomerce/screen/bottom_navigator/view/page_navigation.dart';
import 'package:ecomerce/screen/home/view/home.dart';
import 'package:flutter/material.dart';

import 'screen/auth/sign_in/view/signin.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

  
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home:   const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatelessWidget {
   const MyHomePage({super.key, required this.title});
  final String title;
@override
 Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
      
      ),
      home:
     
           ScreenMAinPage(),
    );

}
}