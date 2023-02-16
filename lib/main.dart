import 'package:device_preview/device_preview.dart';
import 'package:ecomerce/screen/orderDetails/view/orderdetails.dart';
import 'package:flutter/material.dart';
import 'screen/auth/sign_in/view/signin.dart';
import 'package:get/get.dart';

import 'screen/order_place_page.dart/view/order_place.dart';

void main() {
  runApp(DevicePreview(
    enabled: false,
    tools: const [
      ...DevicePreview.defaultTools,
    ],
    builder: (BuildContext context) {
      return const MyApp();
    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home:
            //  ScreenMAinPage()
            // Home()
            // OrderSummery()
            // OrderDetails()
          const SigninPage()

        );
  }
}
