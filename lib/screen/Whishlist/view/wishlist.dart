import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/Whishlist/view/widget/appbar_wishlist.dart';
import 'package:ecomerce/screen/Whishlist/view/widget/wishlist_grid_view.dart';
import 'package:ecomerce/screen/cart/view/cart.dart';
import 'package:ecomerce/screen/home/view/widget/side_Sheet/side_sheet_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

 class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double height = size.height;
     final double width = size.width;
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body:Column(children: [
         AppBarWishList(height: height, width: width),
         Expanded(
          child: ListView(children:[ WishlistGridView(height: height,width: width,)]))
         

      ]) ,

    );
  }
}

