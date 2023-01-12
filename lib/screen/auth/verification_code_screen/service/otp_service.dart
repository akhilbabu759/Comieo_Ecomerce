import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';

class OtpService{
  Dio dio =Dio();
  final apibaseUrl =ApiBaseUrl();
  final apiendUrl =ApiEndsUrl();
  Future<String?> sendOtp(email,context)async
{
  log('otp enabled');
  try{
    final Response response= await dio.get(apibaseUrl.baseurl+apiendUrl.verifyOtp,
    queryParameters: {"email":email});
    if(response.statusCode==200 || response.statusCode==201){
      log('otp created');
      log('otp done');
      return response.data['message'];
    }
  } on DioError catch(e){
    log(e.message,name:'status code' );
    log('otp failed');
    DioException().dioError(e, context);
  }
  return null;
}}