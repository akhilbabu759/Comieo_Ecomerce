import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/account/account_main/model/edit_account_model.dart';

import 'package:ecomerce/screen/account/account_main/model/get_account_model.dart';
import 'package:ecomerce/screen/account/account_main/service/add_account_service.dart';
import 'package:ecomerce/screen/auth/sign_in/controller/sigin_in_controller.dart';
import 'package:ecomerce/screen/auth/sign_in/view/signin.dart';
import 'package:ecomerce/screen/cart/model/get_cart_model.dart';
import 'package:ecomerce/screen/home/model/product_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class AcountController extends GetxController {
  @override
  void onInit() {
    getAllAddress();
    super.onInit();
  }
  int change=0;
  void changeinde(index){
    change=index;
    update();
  }
  final signup = Get.put(SignInController());

  final addressService = AddressService();

  final TextEditingController tittleC = TextEditingController();
  final TextEditingController fullNameC = TextEditingController();
  final TextEditingController phoneC = TextEditingController();
  final TextEditingController pinC = TextEditingController();
  final TextEditingController stateC = TextEditingController();
  final TextEditingController placeC = TextEditingController();
  final TextEditingController addressC = TextEditingController();
  final TextEditingController landmarkC = TextEditingController();
  late ProductModel model;

  bool isLoading = false;

  List<GetAddressModel> addressList = [];
  late ProductElement  prodmodel;

  FlutterSecureStorage storage = const FlutterSecureStorage();
   void productModelForOneProdBuy(modele){
    model=modele;
    update();
    log(model.name,name:'productModelForOneProdBuy' );
    prodmodel = ProductElement(
                                            product: model,
                                            size: model.size[0],
                                            qty: 1,
                                            price: model.price,
                                            discountPrice:
                                                model.discountPrice,
                                            id:model.id);
  
    


  }

  void addAccount() async {
    isLoading = true;
    update();

    final AddressModel model = AddressModel(
      title: tittleC.text.trim(),
      fullName: fullNameC.text.trim(),
      phone: phoneC.text.trim(),
      pin: pinC.text.trim(),
      state: stateC.text.trim(),
      place: placeC.text.trim(),
      address: addressC.text.trim(),
      landMark: landmarkC.text.trim(),
    );

    await addressService.addAddress(model).then((value) {
      if (value != null) {
        log('add account', name: 'add accoutn');
        getAllAddress();

        Get.back();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
    });
    return null;
  }

  Future<String?> getAllAddress() async {
    isLoading = true;
    update();
    await AddressService().getAddress().then((value) {
      if (value != null) {
        log(value.toString());
        addressList = value;
        update();
        isLoading = false;
        update();
        return 'Done';
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
    return null;
  }

  void deleteAddress(String addressId) async {
    log('delete function entered');
    isLoading = true;
    update();
    await AddressService().deleteAddress(addressId).then((value) {
      if (value != null) {
        getAllAddress();
        Get.back();

        Get.snackbar(
          "Delete",
          "Address removed successfully",
          backgroundColor: colorRed,
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading = false;
        update();
        log('false');
      } else {
        isLoading = false;
        update();
        return null;
      }
    });
    isLoading = false;
    update();
  }

  void logout() async {
    isLoading = true;
    update();
    await storage.delete(key: 'token');
    await storage.delete(key: 'refreshToken');
    isLoading = false;
    update();

    Get.offAll(() => const SigninPage());
    signup.logoutLaunch();
    update();
  }
}
