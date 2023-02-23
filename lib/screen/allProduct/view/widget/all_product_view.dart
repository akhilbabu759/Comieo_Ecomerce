import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/controller/wishlist_controller.dart';
import 'package:ecomerce/screen/allProduct/controller/product_category_controller.dart';

import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/product_details.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllProductViewGride extends StatelessWidget {
  AllProductViewGride({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  final apibaseUrl = ApiBaseUrl();

  @override
  Widget build(BuildContext context) {
    final wishlistC = Get.put(WishListController());
    // final productC = Get.put(HomeControll());
    final productC=Get.put(ProductCategoryController());

    return GetBuilder<ProductCategoryController>(
      builder: (controller) => productC.isLoding == true
          ? const Center(
              child: Text('Somthing went wrong'),
            )
          : GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: 1 / 1.5),
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
                                    category:
                                        productC.productlist[index].category,
                                    description:
                                        productC.productlist[index].description,
                                    discountPrice: productC
                                        .productlist[index].discountPrice,
                                    id: productC.productlist[index].id,
                                    image: productC.productlist[index].image,
                                    name: productC.productlist[index].name,
                                    offer: productC.productlist[index].offer,
                                    price: productC.productlist[index].price,
                                    rating: productC.productlist[index].rating,
                                    size: productC.productlist[index].size);
                                Get.to(ProductDeatails(key, model));
                              },
                              child: Container(
                                width: width * 0.5,
                                height: height * 0.28,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorWhite,
                                  image: DecorationImage(
                                    image: NetworkImage(''
                                        '${apibaseUrl.baseurl}/products/${productC.productlist[index].image[0]}'),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            GetBuilder<WishListController>(
                              builder: (controller) => Positioned(
                                right: 0,
                                // bottom: 0,
                                child: IconButton(
                                  onPressed: () {
                                    wishlistC.addOrRemoveFromWishlist(
                                        productC.productlist[index].id
                                        // .product.id
                                        );
                                  },
                                  icon: wishlistC.wishList.isEmpty
                                      ? const Icon(Icons.favorite_border_outlined)
                                      : Icon(
                                          wishlistC.wishList.contains(productC
                                                  .productlist[index].id)
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: wishlistC.wishList.isEmpty
                                              ? colorblack
                                              : wishlistC.wishList.contains(
                                                      productC
                                                          .productlist[index]
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
                          productC.productlist[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: colorblack, fontWeight: FontWeight.w400),
                        ),
                        kHeight10,
                        Row(
                          children: [
                            Text(
                              "₹ ${productC.productlist[index].price.toString()}",
                              style: const TextStyle(
                                color: colorblack,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text:
                                    'Min.${productC.productlist[index].discountPrice}% Off',
                                style: const TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: productC.productlist.length),
    );
  }
}
