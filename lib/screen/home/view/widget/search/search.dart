import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/controller/wishlist_controller.dart';

import 'package:ecomerce/screen/home/controller/home_controll.dart';

import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoC = Get.put(HomeControll());
    final wishlistC = Get.put(WishListController());
     
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: SingleChildScrollView(
          child: SafeArea(
            child:  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CupertinoSearchTextField(
                            prefixInsets: const EdgeInsetsDirectional.fromSTEB(
                                10, 4, 5, 3),
                            backgroundColor:
                                const Color.fromARGB(255, 245, 241, 241),
                            controller: categoC.searchController,
                            onChanged: (value) {
                              categoC.search(value);
                            },
                          ),
                        ),
                        
                        GetBuilder<HomeControll>(
                          builder: (controller) => categoC.searchResult.isEmpty
                ? const Padding(
                  padding: EdgeInsets.only(top:318.0),
                  child: Center(
                      child: Text(
                      'Search result is empty',
                      style: TextStyle(color: colorblack),
                    )),
                )
                : GridView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          crossAxisSpacing: 5,
                                          mainAxisSpacing: 5,
                                          childAspectRatio: 1 / 1.5),
                                  itemBuilder: (BuildContext ctx, int index) {
                                    return ColoredBox(
                                      color: colorWhite,
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            Stack(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    final model =
                                                        ProductDeatailsModel(
                                                            category: categoC
                                                                .searchResult[
                                                                    index]
                                                                .category,
                                                            description: categoC
                                                                .searchResult[
                                                                    index]
                                                                .description,
                                                            discountPrice: categoC
                                                                .searchResult[
                                                                    index]
                                                                .discountPrice,
                                                            id: categoC
                                                                .searchResult[
                                                                    index]
                                                                .id,
                                                            image: categoC
                                                                .searchResult[
                                                                    index]
                                                                .image,
                                                            name: categoC
                                                                .searchResult[
                                                                    index]
                                                                .name,
                                                            offer: categoC
                                                                .searchResult[
                                                                    index]
                                                                .offer,
                                                            price: categoC
                                                                .searchResult[
                                                                    index]
                                                                .price,
                                                            rating: categoC
                                                                .searchResult[
                                                                    index]
                                                                .rating,
                                                            size: categoC
                                                                .searchResult[
                                                                    index]
                                                                .size);
                                                    Get.to(ProductDeatails(
                                                        key, model));
                                                  },
                                                  child: Container(
                                                    width: Get.width * 0.5,
                                                    height: Get.height * 0.28,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      color: colorWhite,
                                                      image: DecorationImage(
                                                        image: NetworkImage(''
                                                            '${ApiBaseUrl().baseurl}/products/${categoC.searchResult[index].image[0]}'),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GetBuilder<WishListController>(
                                                  builder: (controller) =>
                                                      Positioned(
                                                    right: 0,
                                                    child: IconButton(
                                                      onPressed: () {
                                                        wishlistC
                                                            .addOrRemoveFromWishlist(
                                                                categoC
                                                                    .searchResult[
                                                                        index]
                                                                    .id);
                                                      },
                                                      icon: wishlistC
                                                              .wishList.isEmpty
                                                          ? const Icon(Icons
                                                              .favorite_border_outlined)
                                                          : Icon(
                                                              wishlistC.wishList
                                                                      .contains(categoC
                                                                          .searchResult[
                                                                              index]
                                                                          .id)
                                                                  ? Icons
                                                                      .favorite
                                                                  : Icons
                                                                      .favorite_border_outlined,
                                                              color: wishlistC
                                                                      .wishList
                                                                      .isEmpty
                                                                  ? colorblack
                                                                  : wishlistC.wishList.contains(categoC
                                                                          .searchResult[
                                                                              index]
                                                                          .id)
                                                                      ? Colors
                                                                          .red
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
                                              categoC.searchResult[index]
                                                  .description,
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
                                                  "₹ ${categoC.searchResult[index].price.toString()}",
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
                                                        'Min.${categoC.searchResult[index].discountPrice}% Off',
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
                                  itemCount: categoC.searchResult.length),
                        ),
                      ],
                    ),
                  ),
          ),
        ));
  }
}
