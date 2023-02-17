import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/screen/auth/signup/model/model.dart';
import 'package:ecomerce/screen/auth/signup/service/sign_up_service/sign_up_service.dart';
import 'package:ecomerce/screen/auth/verification_code_screen/service/verify_otp_service.dart';
import 'package:ecomerce/screen/bottom_navigator/view/page_navigation.dart';

import 'package:ecomerce/util/dio_exception/error_popup/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class VerifyOtpController extends GetxController {
  final verifyOtps = VerifyOtpService();
  FlutterSecureStorage storage = const FlutterSecureStorage();
  Dio dio = Dio();
  bool isLoading = false;
  String code = '';
  void onSubmitCode(String submitCode) {
    log(
      submitCode,
    );
    code = submitCode;
    update();
  }

  void submitOtp(SignUpModel model, code, context) {
    if (code.length != 4) {
      SnackBarPop.popUp('Please enter the OTP', Colors.red);
    } else {
      isLoading = true;
      update();
      log(model.email);
      log(code);
      verifyOtps
          .verifyOtp(
        model.email,
        code,
      )
          .then(
        (value) {
          log(value.toString(), name: 'verifyotp');
          if (value != null) {
            SignUpService().signupUser(model, context).then((value) {
              log(model.fullname, name: 'signupUser');
              log(value.toString(), name: 'signupUser');
              if (value != null) {
                storage.write(key: 'token', value: value.accessToken);
                storage.write(key: 'refreshToken', value: value.refreshToken);
                Get.offAll(() => ScreenMAinPage());
                isLoading = false;
                update();
              }
            });
          }
        },
      );
    }
  }
}
