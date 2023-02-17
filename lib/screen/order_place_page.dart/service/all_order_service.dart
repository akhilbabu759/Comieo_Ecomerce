import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/order_place_page.dart/model/all_order_deateals.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:ecomerce/util/dio_interceptor/dio_interceptor.dart';

class AllOrderService {
  final dio = Dio();
  final abaseUrl = ApiBaseUrl();
  final aendUrl = ApiEndsUrl();
  Future<List<AllOrder>?> getOrder() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.get(abaseUrl.baseurl + aendUrl.order);
      log('response geted');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('entered to if condition in statuscode');
        log(response.data.toString(), name: 'carousal resposnce');
        final List<AllOrder> orderListe = (response.data as List)
            .map(
              (e) => AllOrder.fromJson(e),
            )
            .toList();
        log(orderListe.length.toString());
        return orderListe;
      } else {
        log('entered in else case');
        return null;
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(
        e,
      );
    }
    return null;
  }
}
