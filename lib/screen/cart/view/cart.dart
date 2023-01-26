import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/cart/view/widget/one_row_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(children: const [
          Text(
            "My Cart",
            style: TextStyle(color: Colors.black),
          ),
          Text("4 items", style: TextStyle())
        ]),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index) => RowCart(),
            ),
          )
        ],
      )),
    );
  }
}

