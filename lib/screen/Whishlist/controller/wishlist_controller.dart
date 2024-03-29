import 'package:ecomerce/screen/Whishlist/model/wishlist_mode.dart';
import 'package:ecomerce/screen/Whishlist/service/wishlist_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListController extends GetxController {
  bool isLoading = false;
  WishlistModel? wmodel;
  List<dynamic> wishList = [];
  WishlistService wishlistService = WishlistService();
  @override
  void onInit() {
    getWishlist();
    super.onInit();
  }

  void getWishlist() async {
    isLoading = true;
    update();
    await wishlistService.getWishlist().then(
      (value) {
        if (value != null) {
          wmodel = value;
          update();
          wishList = wmodel!.products.map((e) => e.product.id).toList();
          update();
          isLoading = false;
          update();
        } else {
          isLoading = false;
          update();
        }
      },
    );
  }

  void addOrRemoveFromWishlist(String productId) async {
    isLoading = true;
    update();
    await wishlistService.addOrRemoveWishlist(productId).then((value) {
      if (value != null) {
        wishlistService.getWishlist().then((value) {
          if (value != null) {
            wmodel = value;
            update();
            getWishlist();
            isLoading = false;
            update();
          } else {
            isLoading = false;
            update();
          }
        });
        if (value == 201) {
          Get.snackbar(
            "Added",
            "Item added to Wishlist",
            icon: const Icon(Icons.add_alert_rounded),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
          );
        } else if (value == 204) {
          Get.snackbar(
            "Remove",
            "Item removed from Wishlist",
            icon: const Icon(Icons.remove_circle_outline_rounded),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: const Color.fromARGB(255, 172, 73, 66),
          );
        }
      } else {
        isLoading = false;
        update();
      }
    });
  }
}
