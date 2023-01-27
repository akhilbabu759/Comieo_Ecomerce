import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:flutter/material.dart';


class FistContiner extends StatelessWidget {
  const FistContiner({Key? key, required this.model}) : super(key: key);
  final ProductDeatailsModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Column(
                children: [
                  const Text(
                    '⭐⭐⭐⭐',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    model.rating,
                    style: textstyle,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: <Widget>[
              const Text(
                '❤️',
                style: TextStyle(fontSize: 27),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Image.network(
                    '${ApiBaseUrl().baseurl}/products/${model.image[0]}'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
