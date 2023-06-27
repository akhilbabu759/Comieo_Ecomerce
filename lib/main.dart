import 'package:device_preview/device_preview.dart';
import 'package:ecomerce/screen/splash/view/splashview.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

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

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: SplashScreen());
  }
}
