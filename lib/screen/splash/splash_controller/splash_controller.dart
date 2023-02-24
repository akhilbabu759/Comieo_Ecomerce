import 'dart:async';

import 'package:ecomerce/screen/auth/sign_in/view/signin.dart';
import 'package:ecomerce/screen/bottom_navigator/view/page_navigation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SplashscreenController extends GetxController {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  String? splashvalue;
  String? signincheck;

  void splashTimer() {
    Timer(
      const Duration(seconds: 3),
      () async {
        splashvalue = await storage.read(key: 'splash');
        signincheck = await storage.read(key: 'token');

        if (signincheck != null) {
          Get.offAll(() => ScreenMAinPage());
        } else {
          if (splashvalue != null) {
            Get.offAll(() => const SigninPage());
          } else {
            Get.offAll(() => const SigninPage());
          }
        }
      },
    );
  }
}
