import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/allProduct/controller/product_category_controller.dart';
import 'package:ecomerce/screen/allProduct/view/widget/all_product_view.dart';
import 'package:ecomerce/screen/home/controller/home_controll.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AllProductViewCategory extends StatelessWidget {
  const AllProductViewCategory({super.key, required this.categerId});
  final String categerId;

  @override
  Widget build(BuildContext context) {
    final homeC=Get.put(HomeControll());
    final productCategoryController=Get.put(ProductCategoryController());
    productCategoryController.findCategoryId(categerId,homeC.productList);
    
    final categoryName= homeC.categorylList.where((element) =>element.id.contains(categerId)).toList();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(63),
        child: AppBar(leading: IconButton(onPressed: () =>Get.back() ,icon: const Icon(Icons.arrow_back_ios,color: colorblack,),),
            elevation: 0,
            title:  Text(
              categoryName[0].name,
              // 'Category',
              style: const TextStyle(color: colorblack),
            ),
            centerTitle: true,
            backgroundColor: colorWhite),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          AllProductViewGride(width: Get.width, height: Get.height)
        ]),
      ),
    );
  }
}
