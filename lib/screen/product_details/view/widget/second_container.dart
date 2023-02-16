import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/controller/wishlist_controller.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/product_details/controller/product_controller.dart';

import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({Key? key, required this.size, required this.model})
      : super(key: key);
  final ProductDeatailsModel model;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final wishlistC = Get.put(WishListController());
    final productController = Get.put(ProductController());

    final cartC = Get.put(CartController());
    return Container(
      width: size.width,
      height: size.height,
      margin: EdgeInsets.only(
        top: size.height * 0.48,
      ),
      decoration: BoxDecoration(
        color: Colors.blueGrey[900],
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                left: 17.0,
                top: 1,
              ),
              child: Row(
                children: [
                  GetBuilder<WishListController>(
                    builder: (controller) => IconButton(
                      onPressed: () {
                        wishlistC.addOrRemoveFromWishlist(
                          model.id,
                        );
                      },
                      icon: wishlistC.wishList.isEmpty
                          ? const Icon(Icons.favorite_border_outlined)
                          : Icon(
                              wishlistC.wishList.contains(
                                model.id,
                              )
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: wishlistC.wishList.isEmpty
                                  ? colorWhite
                                  : wishlistC.wishList.contains(
                                      model.id,
                                    )
                                      ? Colors.red
                                      : colorWhite,
                            ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height*0.1,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 5.0,
                  right: 5,
                ),
                child: Text(
                  model.description,maxLines: 3,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 1.0,
                        left: 9,
                        right: 7,
                      ),
                      child: Icon(
                        Icons.motorcycle_rounded,
                        color: colorWhite,
                      ),
                    ),
                    Text(
                      'COD Available',
                      style: TextStyle(
                        color: colorWhite,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: 'Price\n ',
                          style: const TextStyle(fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                              style: const TextStyle(
                                color: Colors.green,
                              ),
                              text: '${model.discountPrice}% off ',
                            ),
                            TextSpan(
                              text: model.offer.toString(),
                              style: const TextStyle(
                                color: colorWhite,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            TextSpan(
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                                color: colorWhite,
                              ),
                              text: '  ₹${model.price}',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: colorWhite),
                  ),
                  child: IconButton(
                    onPressed: () {
                      cartC.addToCart(
                        model.id,
                        model.size[productController.size].toString(),
                      );
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: colorWhite,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: colorWhite,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                          ),
                          maximumSize: Size(
                            size.width * 2.001,
                            size.height * 2.001,
                          ),
                          minimumSize: Size(
                            size.width * 0.71,
                            size.height * 0.001,
                          )),
                      onPressed: () {},
                      child: const Text(
                        'BUY NOW',
                        style: TextStyle(
                          color: colorblack,
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
