import 'dart:async';

import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/auth/sign_in/model/sign_in_model.dart';
import 'package:ecomerce/screen/auth/sign_in/service/sign_in_sevice.dart';
import 'package:ecomerce/screen/bottom_navigator/view/page_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  static final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  SignInService signinS = SignInService();
  bool isLoading = false;

  void signIn() {
    isLoading = true;
    update();
    final signinModel = SignInModel(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    signinS
        .signinUser(
      signinModel,
    )
        .then(
      (value) {
        if (value != null) {
          storage.write(key: 'token', value: value.accessToken);
          storage.write(key: 'refreshToken', value: value.refreshToken);
          Timer(const Duration(seconds: 3), () async {
            await Get.offAll(() => ScreenMAinPage());
            isLoading = false;
            update();
          });
        } else {
          return;
        }
      },
    );
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value.length > 8) {
      return 'Password exceeds 8 character';
    }
    return null;
  }

  String? emailValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return 'Invalid email , please enter correct email';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: colorWhite,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: colorWhite,
      );
      obscureText = true;
      update();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: colorWhite,
      );
      obscureText = false;
      update();
    }
  }
}
