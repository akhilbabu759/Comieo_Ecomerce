import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/auth/signup/model/model.dart';
import 'package:ecomerce/screen/auth/signup/model/token_model.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:flutter/material.dart';

class SignUpService{
  final dio = Dio();
  final abaseurl =ApiBaseUrl();
  final aendUrl = ApiEndsUrl();
  Future<SignUpTokenModel?> signupUser(SignUpModel signupmodel,BuildContext context)async{

    try{
      Response response = await dio.post(abaseurl.baseurl+aendUrl.sgnup,
      data: jsonEncode(signupmodel.toJson(),));
      log(response.statusCode.toString());
      if(response.statusCode!>=200 || response.statusCode!<=299){
        final signupResponse =SignUpTokenModel.fromJson(response.data);
        log(response.data.toString());
        return signupResponse;
      }else{
        log(response.statusCode.toString());
      }
    }on DioError catch(e){
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;
   

  }
}