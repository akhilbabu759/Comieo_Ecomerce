import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/account/account_main/model/edit_account_model.dart';

import 'package:ecomerce/screen/account/account_main/model/get_account_model.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:ecomerce/util/dio_interceptor/dio_interceptor.dart';

class AddressService {
  final apibaseUrl = ApiBaseUrl();
  final apiendUrl = ApiEndsUrl();
  Future<String?> addAddress(AddressModel model) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      log('try');
      final Response response = await dios.post(
        apibaseUrl.baseurl + apiendUrl.address,
        data: model.toJson(),
      );
      log('response');

      if (response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString(), name: 'add');
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<List<GetAddressModel>?> getAddress() async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      final Response response = await dios.get(
        apibaseUrl.baseurl + apiendUrl.address,
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.data == null) {
          return null;
        } else {
          final List<GetAddressModel> model = (response.data as List)
              .map((e) => GetAddressModel.fromJson(e))
              .toList();

          log(response.data.toString());
          return model;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }

  Future<String?> deleteAddress(String addressId) async {
    Dio dios = await ApiInterceptor().getApiUser();
    try {
      log('try');
      final Response response = await dios.delete(
        "${apibaseUrl.baseurl + apiendUrl.address}/$addressId",
      );
      log('response');

      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 202) {
        if (response.data == null) {
          return null;
        } else {
          final String result = response.data['message'];
          log(result.toString());
          return result;
        }
      }
    } on DioError catch (e) {
      log(e.message);
      DioException().dioError(e);
    }
    return null;
  }
}
