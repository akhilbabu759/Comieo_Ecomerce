import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/product_details/model/product_model.dart';
import 'package:ecomerce/screen/product_details/view/widget/first_container.dart';
import 'package:ecomerce/screen/product_details/view/widget/second_container.dart';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Body extends StatelessWidget {
  const Body(Key?key, this.model):super(key: key);
  final ProductDeatailsModel model;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(
      // physics: NeverScrollableScrollPhysics(), 
      children: [
      Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                SecondContainer(size: size,model: model),
                 FistContiner(model: model,)
              ],
            ),
          )
        ],
      ),
    ]);
  }
}

