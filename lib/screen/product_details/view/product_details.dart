import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/widget/body.dart';
import 'package:flutter/material.dart';

class ProductDeatails extends StatelessWidget {
  const ProductDeatails(Key?key, this.model):super(key: key);
  final ProductDeatailsModel model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body:   Body(key, model),
    );
  }
}
