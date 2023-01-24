import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/product_details/view/widget/first_container.dart';
import 'package:ecomerce/screen/product_details/view/widget/second_container.dart';

import 'package:flutter/material.dart';
import 'package:share/share.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ListView(physics: NeverScrollableScrollPhysics(), children: [
      Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                SecondContainer(size: size),
                const FistContiner()
              ],
            ),
          )
        ],
      ),
    ]);
  }
}

