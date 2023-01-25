import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/product_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeGridView extends StatelessWidget {
  HomeGridView({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    final productC = Get.put(HomeControll());
    // final wishlistC = Get.put(WishListController(context));
    return GetBuilder<HomeControll>(
      builder: (controller) => productC.isLoding == true
          ? Center(
              child: Text('empty'),
            )
          : GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.7),
              itemBuilder: (BuildContext ctx, int index) {
                return ColoredBox(
                  //  height: height * 0.000001,
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
                                    category:
                                        productC.productList[index].category,
                                    description:
                                        productC.productList[index].description,
                                    discountPrice: productC
                                        .productList[index].discountPrice,
                                    id: productC.productList[index].id,
                                    image: productC.productList[index].image,
                                    name: productC.productList[index].name,
                                    offer: productC.productList[index].offer,
                                    price: productC.productList[index].price,
                                    rating: productC.productList[index].rating,
                                    size: productC.productList[index].size);
                                Get.to(ProductDeatails(key,model));
                              },
                              child: Container(
                                width: width * 0.5,
                                height: height * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorWhite,
                                  image: DecorationImage(
                                    image: NetworkImage(''
                                        '${apibaseUrl.baseurl}/products/${productC.productList[index].image[0]}'),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // GetBuilder<WishListController>(
                            //   builder: (controller) => Positioned(
                            //     right: 0,
                            //     bottom: 0,
                            //     child: IconButton(
                            //       onPressed: () {
                            //         wishlistC.addOrRemoveFromWishlist(
                            //             context,
                            //             wishlistC.wmodel!.products[index]
                            //                 .product.id);
                            //       },
                            //       icon: Icon(
                            //         wishlistC.wishList.contains(wishlistC
                            //                 .wmodel!.products[index].product.id)
                            //             ? Icons.favorite_border_outlined
                            //             : Icons.favorite,
                            //         color: wishlistC.wishList.contains(wishlistC
                            //                 .wmodel!.products[index].product.id)
                            //             ? colorWhite
                            //             : Colors.red,
                            //       ),
                            //     ),
                            //   ),
                            // )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        // RatingBar.builder(
                        //   initialRating: double.parse(
                        //       wishlistC.wmodel!.products[index].product.rating),
                        //   itemSize: 15,
                        //   minRating: 1,
                        //   direction: Axis.horizontal,
                        //   allowHalfRating: true,
                        //   ignoreGestures: true,
                        //   itemBuilder: (context, _) => const Icon(
                        //     Icons.star,
                        //     color: Colors.amber,
                        //   ),
                        //   onRatingUpdate: (startRating) {
                        //     log(startRating.toString());
                        //   },
                        // ),
                        Text(
                          // 'otty',
                          productC.productList[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: colorWhite, fontWeight: FontWeight.w400),
                        ),
                        kHeight10,
                        Row(
                          children: [
                            Text(
                              // '50',
                              "₹ ${productC.productList[index].price.toString()}",
                              style: const TextStyle(
                                color: colorWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: productC.productList.length
              // productC.productList.length,
              ),
    );
  }
}
