import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/auth/signup/model/model.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';

class OtpService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> sendOtp(
    SignUpModel mode,
  ) async {
    log('otp enabled');
    try {
      log('trye enter');
      log(mode.email);
      Response response = await dio.get(
        apibaseUrl.baseurl + apiendUrl.verifyOtp,
        queryParameters: {"email": mode.email},
      );
      log(response.toString());
      log(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp created');
        log('otp done');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message, name: 'status code');
      log('otp failed');
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
