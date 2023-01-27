import 'dart:developer';


import 'package:ecomerce/screen/cart/model/add_cart_model.dart';
import 'package:ecomerce/screen/cart/model/get_cart_model.dart';
import 'package:ecomerce/screen/cart/service/cart_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  CartController(){
    getCart();
  }
  bool isLoading = false;
  GetCartModel? cartList;
  List<String> cartItemsId = [];
  int quantity = 1;
  int totalproductCount = 1;
  int? totalSave;
  CartService service = CartService();
  // final bottomC = Get.put(LandingPageController());

  void getCart() async {
    isLoading = true;
    update();
    await service.getCart().then((value) {
      if (value != null) {
        cartList = value;
        update();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        totalSave = (cartList!.totalPrice - cartList!.totalDiscount).toInt();
        totalProductCount();
        update();
        isLoading = false;
        update();
      } else {
        isLoading = false;
        update();
      }
      return null;
    });
  }

  void addToCart(String productId, String size) async {
    log('here');
    isLoading = true;
    update();
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: quantity,
      productId: productId,
    );
    await service.addToCart(model).then((value) {
      if (value != null) {
        getCart();
        if (value == "product added to cart successfully") {
          Get.snackbar(
            "Added",
            "Product Added To Cart Successfully",
            colorText: Colors.green,
            icon: const Icon(
              Icons.add_alert_rounded,
              color: Colors.black,
            ),
          );
        }
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
        // if(productQuantity>1){
        // quantity=quantity+(qty);
        // log(qty.toString());
        // }
    final AddCartModel model = AddCartModel(
      size: size.toString(),
      quantity: qty,
      productId: productId,
    );
    qty=1;
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

  // void goToCartFromProduct() {
  //   getCart();
  //   Get.to(() => ScreenOrder());
  // }

  // void toProductScreen(index) {
  //   Get.toNamed(ScreenProductView.routeName, arguments: cartItemsId[index]);
  // }
}
