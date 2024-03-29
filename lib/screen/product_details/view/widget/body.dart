import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/widget/first_container.dart';
import 'package:ecomerce/screen/product_details/view/widget/second_container.dart';

import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body(Key? key, this.model) : super(key: key);
  final ProductDeatailsModel model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(physics: const NeverScrollableScrollPhysics(), children: [
      Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                FistContiner(
                  model: model,
                ),
                Positioned(top: MediaQuery.of(context).size.height*0.01,
                  child: SecondContainer(size: size, model: model)),
              ],
            ),
          )
        ],
      ),
    ]);
  }
}
