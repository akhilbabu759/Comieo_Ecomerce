import 'dart:developer';


import 'package:ecomerce/screen/cart/model/add_cart_model.dart';
import 'package:ecomerce/screen/cart/model/get_cart_model.dart';
import 'package:ecomerce/screen/cart/service/cart_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  
  
  @override
  void onInit(){
     getCart();
    
    super.onInit();
  
    
  }
 
  RxBool isLoading = false.obs;
  GetCartModel? cartList;
  List<String> cartItemsId = [];
  int quantity = 1;
  int totalproductCount = 1;
  int? totalSave;
  CartService service = CartService();
  

  void getCart() async {
    isLoading = true.obs;
    // update();
    await service.getCart().then((value) {
      if (value != null) {
        cartList = value;
        update();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        totalSave = (cartList!.totalPrice - cartList!.totalDiscount).toInt();
        totalProductCount();
        update();
        isLoading = false.obs;
        // update();
      } else {
        isLoading = false.obs;
        // update();
      }
      isLoading = false.obs;
        // update();
      return null;
    });
    isLoading = false.obs;
  }

  void addToCart(String productId, String size) async {
    log('here');
    isLoading = true.obs;
    update();
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    await service.addToCart(model).then((value) {
      if (value != null) {
        getCart();
        log(value);
        // if (value == "product added to cart successfully") {
          
        //   Get.snackbar(
        //        "Added",
        //     "Product Added To Cart Successfully",
        //        icon: Icon(
        //       Icons.add_alert_rounded,
        //       color: Colors.black,
        //     ),
        //        snackPosition: SnackPosition.BOTTOM,
        //        backgroundColor: Colors.green,
        //        );
        // }
      } else {
         
        null;
      }
    });
  }

  void removeCart(productId) {
    log('get in to remove controller');
    service.removeFromCart(productId).then(
      (value) {
        if (value != null) {
          getCart();
          log(totalSave.toString());
          Get.back();
          Get.snackbar(
            "Remove",
            "Product removed from cart successfully",
            colorText: Colors.red,
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.black,
            ),
          );
          update();
        } else {
          return;
        }
      },
    );
  }

  void totalProductCount() {
    int count = 0;
    for (var i = 0; i < cartList!.products.length; i++) {
      count = count + cartList!.products[i].qty;
    }
    totalproductCount = count;
    update();
  }

  Future<void> incrementDecrementQty(
      int qty, String productId, int productQuantity, String size) async {
         log(qty.toString());
         if(qty==-1 &&productQuantity==1){
          Get.snackbar(
            "required minimum quantity",
            "minimum quantity is 1",
            colorText: Colors.red,
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.black,
            ),
          );


         }else{
       
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: qty,
      productId: productId,
    );
   
    if (productQuantity >= 1) {
      await CartService().addToCart(model).then(
        (value) async {
          if (value != null) {
            await CartService().getCart().then(
              (value) {
                if (value != null) {
                  cartList = value;
                  update();
                  totalProductCount();
                  cartItemsId =
                      cartList!.products.map((e) => e.product.id).toList();
                  update();
                  totalSave = cartList!.totalDiscount.toInt() -
                      cartList!.totalPrice.toInt();
                  update();
                } else {
                  null;
                }
              },
            );
          } else {
            null;
          }
        },
      );
    }
         }
  }

  
}
