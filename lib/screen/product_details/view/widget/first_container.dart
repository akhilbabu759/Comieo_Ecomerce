import 'dart:developer';

import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';


class FistContiner extends StatelessWidget {
  const FistContiner({Key? key, required this.model}) : super(key: key);
  final ProductDeatailsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: Get.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[const SizedBox(height: 22),
            Container(
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(20)),
              child: Text(
                '  ${model.discountPrice}% off  ',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  model.name,
                  style: const TextStyle(
                      color: colorblack,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Column(
                  children: [
                     RatingBar.builder(
                            initialRating: double.parse(
                                // productC.productList[index].rating
                                model.rating
                                ),
                            itemSize: 15,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            ignoreGestures: true,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (startRating) {
                              log(startRating.toString());
                            },
                          ),
                    Text(
                      model.rating,
                      style: textstyle,
                    )
                  ],
                )
              ],
            ),
            
            Row(
              children: <Widget>[
                
                const SizedBox(
                  width: 70,
                ),
                Image.network(height: 180,width: 260,
                    '${ApiBaseUrl().baseurl}/products/${model.image[0]}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
