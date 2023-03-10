import 'package:ecomerce/core/text_style.dart';

import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/widget/body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

class ProductDeatails extends StatelessWidget {
  const ProductDeatails(Key? key, this.model) : super(key: key);
  final ProductDeatailsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Share.share(
                'https://play.google.com/store/apps/details?id=com.',
              );
            },
            child: const Icon(
              Icons.share,
              size: 30,
            ),
          ),
          const SizedBox(
            width: 17,
          )
        ],
      ),
      body: Body(key, model),
    );
  }
}
