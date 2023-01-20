import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/common/api_endsurl.dart';
import 'package:ecomerce/screen/home/model/carosual_model.dart';
import 'package:ecomerce/util/dio_exception/exception.dart';
import 'package:ecomerce/util/dio_interceptor/dio_interceptor.dart';

class CarouselService{
  final dio =Dio();
  final abaseUrl=ApiBaseUrl();
  final aendUrl=ApiEndsUrl();
  Future<List<CarousalModel>?> getCarosel(context)async{
    Dio dio =await ApiInterceptor().getApiUser(context);
    try{
      Response  response= await dio.get(abaseUrl.baseurl+aendUrl.carousal);
      if(response.statusCode==200 || response.statusCode == 201){
        log(response.data);
        final List<CarousalModel> carouselList= (response.data as List).map((e) => CarousalModel.fromJson(e),).toList();
        return carouselList; 
      }else {
        return null;
      }
    } on DioError catch(e){
      log(e.message);
      DioException().dioError(e, context);
    }
    return null;



  }

}