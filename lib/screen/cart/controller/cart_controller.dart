import 'dart:developer';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/cart/model/add_cart_model.dart';
import 'package:ecomerce/screen/cart/model/get_cart_model.dart';
import 'package:ecomerce/screen/cart/service/cart_service.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CartController extends GetxController {
  @override
  void onInit() {
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
  List<String> cartitemsPayId = [];
  List<ProductElement> reversedProcuct = [];

  Future<void> getCart() async {
    isLoading = true.obs;

    await service.getCart().then((value) {
      if (value != null) {
        cartList = value;
        update();
        cartItemsId = cartList!.products.map((e) => e.product.id).toList();
        update();
        cartitemsPayId = cartList!.products.map((e) => e.id).toList();

        totalSave =
            ((cartList!.totalPrice) - (cartList!.totalDiscount)).toInt();
        update();
        totalProductCount();
        update();

        reversedProcuct = List.from(cartList!.products.reversed);
        update();
        isLoading = false.obs;
      } else {
        isLoading = false.obs;
      }
      isLoading = false.obs;

      return null;
    });
    isLoading = false.obs;
  }

  Future<void> addToCart(String productId, String size, int optionCheck) async {
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

        optionCheck == 1
            ? ''
            : Get.snackbar(
                "Added",
                "Product Added To Cart Successfully",
                icon: const Icon(
                  Icons.add_alert_rounded,
                  color: Colors.black,
                ),
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green,
              );
      } else {
        null;
      }
    });
  }

  void removeCart(productId) {
    log('get in to remove controller');
    service.removeFromCart(productId).then(
      (value) async {
        if (value != null) {
          await service.getCart().then((value) {
            if (value != null) {
              cartList = value;

              update();
              reversedProcuct = List.from(cartList!.products.reversed);
              update();
            }
          });
          log(totalSave.toString());

          Get.snackbar(
            "Remove",
            "Product removed from cart successfully",
            icon: const Icon(
              Icons.remove_circle,
              color: Colors.black,
            ),
            backgroundColor: colorRed,
            snackPosition: SnackPosition.BOTTOM,
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
    int qty,
    String productId,
    int productQuantity,
    String size,
  ) async {
    await getCart();
    log(qty.toString());
    log(productQuantity.toString());

    if (qty == -1 && productQuantity == 1) {
      removeCart(productId);
    } else {
      log(qty.toString(), name: 'quantitiy');
      log(size.toString(), name: 'quantitiy');
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
                    reversedProcuct = List.from(cartList!.products.reversed);
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
