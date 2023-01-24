import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/auth/sign_in/model/sign_in_model.dart';
import 'package:ecomerce/screen/auth/sign_in/model/sign_in_token.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/response/response.dart';

class SignInService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  SignInModel? signinModel;
  Future<SigninTokenModel?> signinUser(
      SignInModel model, ) async {
    try {
      Response response = await dio.post(
        apibaseUrl.baseurl + apiendUrl.signIn,
        data: jsonEncode(
          model.toJson(),
        ),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final signinModel = SigninTokenModel.fromJson(response.data);
        log(response.data.toString());

        return signinModel;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e, );
    }
    return null;
  }
}
