import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/home/model/product_model.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:ecomerce/util/dio_interceptor/dio_interceptor.dart';

class ProductService {
  final dio = Dio();
  final abaseUrl = ApiBaseUrl();
  final aendUrl = ApiEndsUrl();
  Future<List<ProductModel>?> getProduct() async {
    Dio dio = await ApiInterceptor().getApiUser();
    try {
      Response response = await dio.get(abaseUrl.baseurl + aendUrl.product);
      log('response geted');
      log(response.data.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('entered to if condition in statuscode');
        log(response.data.toString(), name: 'carousal resposnce');
        final List<ProductModel> productlListe = (response.data as List)
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList();
        log(productlListe.length.toString());
        return productlListe;
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
