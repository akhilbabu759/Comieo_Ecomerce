import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/controller/wishlist_controller.dart';
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
    final wishlistC = Get.put(WishListController());
    final productC = Get.put(HomeControll());

    return GetBuilder<HomeControll>(
      builder: (controller) => productC.isLoding == true
          ? const Center(
              child: Text('Somthing went wrong'),
            )
          : GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                  childAspectRatio: height*2 / height * 0.33),
              
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
                                Get.to(ProductDeatails(key, model));
                              },
                              child: Container(
                                width: width * 0.5,
                                height: height * 0.19,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: colorWhite,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        '${apibaseUrl.baseurl}/products/${productC.productList[index].image[0]}',),
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
                                        productC.productList[index].id);
                                  },
                                  icon: wishlistC.wishList.isEmpty
                                      ? const Icon(
                                          Icons.favorite_border_outlined)
                                      : Icon(
                                          wishlistC.wishList.contains(productC
                                                  .productList[index].id)
                                              ? Icons.favorite
                                              : Icons.favorite_border_outlined,
                                          color: wishlistC.wishList.isEmpty
                                              ? colorblack
                                              : wishlistC.wishList.contains(
                                                      productC
                                                          .productList[index]
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
                          productC.productList[index].description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: colorblack, fontWeight: FontWeight.w400),
                        ),
                        kHeight10,
                        Row(
                          children: [
                            Text(
                              "₹ ${productC.productList[index].price.toString()}",
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
                                    'Min.${productC.productList[index].discountPrice}% Off',
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
              itemCount: productC.productList.length),
    );
  }
}
