import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';

class VerifyOtpService {
  Dio dio = Dio();
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> verifyOtp(
    email,
    otpCode,
  ) async {
    try {
      final Response response = await dio.post(
        apibaseUrl.baseurl + apiendUrl.verifyOtp,
        data: {'email': email, 'otp': otpCode},
      );
      log(response.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('otp verified');
        return response.data['message'];
      }
    } on DioError catch (e) {
      log(e.message, name: 'dio catch');
      log('verification falied');
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
