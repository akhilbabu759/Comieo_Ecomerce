import 'dart:developer';

import 'package:ecomerce/core/constent.dart';

import 'package:ecomerce/screen/auth/signup/model/model.dart';
import 'package:ecomerce/screen/auth/signup/service/sign_up_service/sign_up_service.dart';
import 'package:ecomerce/screen/auth/verification_code_screen/service/otp_service.dart';
import 'package:ecomerce/screen/auth/verification_code_screen/view/verification.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformpasswordController =
      TextEditingController();
  bool isLoging = false;
  final signupS = SignUpService();
  Future<void> addUser(BuildContext context) async {
    log(usernameController.text);
    isLoging = true;
    update();
    final signupmodel = SignUpModel(
        fullname: usernameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text);
    OtpService()
        .sendOtp(
      signupmodel,
    )
        .then(
      (value) {
        if (value != null) {
          Get.to(() => ScreenVerificationCode(
                model: signupmodel,
              ));
          isLoging = false;
          update();
          disposeTextfield();
        } else {
          return;
        }
      },
    );
  }

  void disposeTextfield() {
    // usernameController.clear();
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    phoneController.clear();
    conformpasswordController.clear();
  }

  String? nameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else {
      return null;
    }
  }

  String? usernameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the username';
    } else if (value.length < 2) {
      return 'Too short username';
    } else {
      return null;
    }
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

  String? mobileValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    } else if (value.length < 10) {
      return 'Invalid mobile number,make sure your entered 10 digits';
    } else {
      return null;
    }
  }

  String? passwordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    }

    return null;
  }

  String? confirmpasswordValdation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value.length < 8) {
      return 'Password must have atleast 8 character';
    } else if (value != passwordController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }

  bool obscureText = true;
  Icon icon = const Icon(
    Icons.visibility_off,
    color: colorblack,
  );

  void visibility() {
    if (obscureText == false) {
      icon = const Icon(
        Icons.visibility_off,
        color: colorblack,
      );
      obscureText = true;
      update();
    } else {
      icon = const Icon(
        Icons.visibility,
        color: colorblack,
      );
      obscureText = false;
      update();
    }
  }
}
