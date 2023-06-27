import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/controller/wishlist_controller.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';

import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/product_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WishlistGridView extends StatelessWidget {
  WishlistGridView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    final cartC = Get.put(CartController());
    final wishlistC = Get.put(WishListController());

    return GetBuilder<WishListController>(
      builder: (controller) => wishlistC.isLoading == true
          ? const Center(
              child: CircularProgressIndicator(
                color: colorWhite,
                backgroundColor: Colors.cyan,
              ),
            )
          : wishlistC.wmodel == null || wishlistC.wmodel!.products.isEmpty
              ? SizedBox(
                  height: Get.size.height / 1,
                  child: const Center(
                    child: Text('Wishlist is Empty'),
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      childAspectRatio: 1 / 1.65),
                  itemBuilder: (BuildContext ctx, int index) {
                    return ColoredBox(
                      color: colorWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    final model = ProductDeatailsModel(
                                        category: wishlistC.wmodel!
                                            .products[index].product.category,
                                        description: wishlistC
                                            .wmodel!
                                            .products[index]
                                            .product
                                            .description,
                                        discountPrice: wishlistC
                                            .wmodel!
                                            .products[index]
                                            .product
                                            .discountPrice,
                                        id: wishlistC
                                            .wmodel!.products[index].product.id,
                                        image: wishlistC.wmodel!.products[index]
                                            .product.image,
                                        name: wishlistC.wmodel!.products[index]
                                            .product.name,
                                        offer: wishlistC.wmodel!.products[index]
                                            .product.offer,
                                        price: wishlistC.wmodel!.products[index]
                                            .product.price,
                                        rating: wishlistC.wmodel!
                                            .products[index].product.rating,
                                        size: wishlistC.wmodel!.products[index]
                                            .product.size);
                                    Get.to(ProductDeatails(key, model));
                                  },
                                  child: Container(
                                    width: width * 0.5,
                                    height: height * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: colorWhite,
                                      image: DecorationImage(
                                        image: NetworkImage(''
                                            '${apibaseUrl.baseurl}/products/${wishlistC.wmodel!.products[index].product.image[0]}'),
                                        // fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                GetBuilder<WishListController>(
                                  builder: (controller) => Positioned(
                                    right: 0,
                                    child: IconButton(
                                      onPressed: () {
                                        wishlistC.addOrRemoveFromWishlist(
                                            wishlistC.wmodel!.products[index]
                                                .product.id
                                            // .product.id
                                            );
                                      },
                                      icon: wishlistC.wishList.isEmpty
                                          ? const Icon(
                                              Icons.favorite_border_outlined)
                                          : Icon(
                                              wishlistC.wishList.contains(
                                                      wishlistC
                                                          .wmodel!
                                                          .products[index]
                                                          .product
                                                          .id)
                                                  ? Icons.favorite
                                                  : Icons
                                                      .favorite_border_outlined,
                                              color: wishlistC.wishList.isEmpty
                                                  ? colorblack
                                                  : wishlistC.wishList.contains(
                                                          wishlistC
                                                              .wmodel!
                                                              .products[index]
                                                              .product
                                                              .id)
                                                      ? Colors.red
                                                      : colorblack,
                                            ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              wishlistC
                                  .wmodel!.products[index].product.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  color: colorblack,
                                  fontWeight: FontWeight.w400),
                            ),
                            kHeight10,
                            Row(
                              children: [
                                Text(
                                  "₹ ${wishlistC.wmodel!.products[index].product.offer.toString()}",
                                  style: const TextStyle(
                                    color: colorblack,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            Row(
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text:
                                        'Min.${wishlistC.wmodel!.products[index].product.discountPrice}% Off',
                                    style: const TextStyle(
                                      color: Colors.green,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () => cartC.addToCart(
                                  wishlistC.wmodel!.products[index].product.id,
                                  wishlistC.wmodel!.products[index].product.size[0]
                                      .toString(),
                                  0),
                              child: const Card(
                                elevation: 2,
                                child: Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      'Add to cart',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    )
                                  ],
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: wishlistC.wmodel!.products.length),
    );
  }
}
