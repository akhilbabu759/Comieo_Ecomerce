import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/allProduct/view/all_product_view.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:ecomerce/screen/home/view/widget/cardView/home_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categoC = Get.put(HomeControll());
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(63),
          child: AppBar(
              actions: [
                SizedBox(
                  height: 45,
                  child: CupertinoSearchTextField(
                    prefixInsets:
                        const EdgeInsetsDirectional.fromSTEB(10, 4, 5, 3),
                    backgroundColor: const Color(0xFFF0EFFF),
                    controller: categoC.searchController,
                    onChanged: (value) {
                      categoC.search(value);
                    },
                  ),
                )
              ],
              elevation: 0,
              title: const Text(
                'Category',
                style: TextStyle(color: colorblack),
              ),
              centerTitle: true,
              backgroundColor: colorWhite),
        ),
        backgroundColor: Colors.blueGrey[50],
        body: SafeArea(
          child: Column(
            children: [
              textFieldGap,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 3.0, right: 2),
                  child: GridView.builder(
                      itemCount: categoC.seachResult.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 0,
                              childAspectRatio: 1 / 1.3),
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.to(
                              AllProductViewCategory(
                                  categerId: categoC.seachResult[index].id),
                            ),
                            child: HomeCard(
                              imag: categoC.seachResult[index].image[0],
                              text: categoC.seachResult[index].name,
                            ),
                          )),
                ),
              ),
            ],
          ),
        ));
  }
}
