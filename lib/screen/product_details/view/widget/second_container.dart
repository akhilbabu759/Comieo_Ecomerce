import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/controller/wishlist_controller.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:share/share.dart';

class SecondContainer extends StatelessWidget {
  const SecondContainer({Key? key, required this.size, required this.model})
      : super(key: key);
  final ProductDeatailsModel model;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final wishlistC =Get.put(WishListController());
   
    final cartC = Get.put(CartController());
    return Container(
      width: size.width,
      margin: EdgeInsets.only(top: size.height * 0.3),
      // height: 500,
      decoration: const BoxDecoration(
        color: colorWhite,
        borderRadius: BorderRadius.only(
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
            textFieldGap,
            Padding(
              padding: const EdgeInsets.only(
                left: 17.0,
                top: 15,
              ),
              child: Row(
                children: [
                  //  Icon(Icons.share,size: 30,),
                   GetBuilder<WishListController>(
                              builder: (controller) =>
                               IconButton(
                                 onPressed: () {
                                   wishlistC.addOrRemoveFromWishlist(
                                    model.id
                                       
                                      //  productC.productList[index].id
                                           // .product.id
                                           );
                                 },
                                 icon:
                                  wishlistC.wishList.isEmpty?Icon(Icons.favorite_border_outlined):
                                  Icon(
                                   wishlistC.wishList.contains(model.id)
                                       ? Icons.favorite
                                       :  Icons.favorite_border_outlined,
                                   color:wishlistC.wishList.isEmpty?colorblack : wishlistC.wishList.contains(model.id)
                                       ?  Colors.red
                                       :colorblack ,
                                 ),
                               ),
                            ),
                  const SizedBox(
                    width: 10,
                  ),

                  SizedBox(
                    height: size.height * 0.05,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                model.description,
                // 'A product detail page (PDP) is a web page on an e - commerce site that presents the description of a specific product in view. The details displayed often include size, color, price, shipping information, reviews, and other relevant information customers may want to know before making a purchase',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '  SIZE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'PRICE ',
                        children: <TextSpan>[
                          TextSpan(
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                            text: '${model.discountPrice}% off ',
                          ),
                          TextSpan(
                            text: model.price.toString(),
                            style: const TextStyle(
                              color: Colors.black87,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          TextSpan(
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                              color: Colors.black,
                            ),
                            text: '  ₹${model.offer}',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Card(
                  color: Colors.blueGrey,
                  child: Text(
                    model.size[0],
                    style: textstyle,
                  ),
                ),
                Card(
                  color: Colors.blueGrey,
                  child: Text(
                    model.size[1],
                    style: textstyle,
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 58,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                  child: IconButton(
                    onPressed: () {
                      cartC.addToCart(model.id, model.size.toString());

                      Get.to(const CartScreen());
                    },
                    icon: const Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          elevation: 20,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          maximumSize:
                              Size(size.width * 2.001, size.height * 2.001),
                          minimumSize:
                              Size(size.width * 0.71, size.height * 0.001)),
                      onPressed: () {},
                      child: const Text(
                        'BUY NOW',
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
