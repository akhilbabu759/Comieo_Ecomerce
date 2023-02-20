import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:ecomerce/util/dio_interceptor/dio_interceptor.dart';

class OrderDetailService{
   Future<String?> cancelOrder(orderId) async {
    try {
      final Dio dios = await ApiInterceptor().getApiUser();
      final Response response = await dios.patch(
        "${ApiBaseUrl().baseurl + ApiEndsUrl().order}/$orderId",
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final order = response.data['message'];
          log(order.toString());
          

          return order;
        }
      } else {
        return null;
      }
    } on DioError catch (e) {
      log(e.message.toString());
      DioException().dioError(e);
    }
    return null;
  }
}