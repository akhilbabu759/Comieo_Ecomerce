import 'dart:developer';

import 'package:ecomerce/common/api_baseurl.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RowCart extends StatelessWidget {
  const RowCart({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final cartcontrol = Get.put(CartController());

    return Dismissible(
      key: Key('1'),
      child: Row(
        children: [
          SizedBox(
            width: 88,
            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.network(
                    '${ApiBaseUrl().baseurl}/products/${cartcontrol.cartList!.products[index].product.image[0]}'),
                // 'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartcontrol.cartList!.products[index].product.name,
                style: TextStyle(fontSize: 16, color: Colors.black),
                maxLines: 2,
              ),
              Text.rich(TextSpan(
                  text: cartcontrol.cartList!.products[index].product.price
                      .toString(),
                  style:
                      TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
                  children: [
                    TextSpan(
                        text: "x" +
                            cartcontrol.cartList!.products[index].qty
                                .toString(),
                        style: TextStyle(color: Colors.red))
                  ]))
            ],
          ),
          SizedBox(
            width: size.width * 0.16,
          ),
          Column(
            children: [
              ColoredBox(
                color: Colors.grey,
                child: GestureDetector(
                    child: Icon(Icons.add),
                    onTap: () {
                      cartcontrol.incrementDecrementQty(
                        1,
                        cartcontrol.cartList!.products[index].product.id,
                        cartcontrol.cartList!.products[index].qty,
                        cartcontrol.cartList!.products[index].product.size
                            .toString());
                    }
                    // cartcontrol.adding(),
                    ),
              ),
              GetBuilder<CartController>(
                builder: (controller) {
                  return SizedBox(
                      child: Text(
                          cartcontrol.cartList!.products[index].qty.toString())
                      // cartcontrol.value.toString()),
                      );
                },
              ),
              ColoredBox(
                color: Colors.grey,
                child:
                    GestureDetector(child: Icon(Icons.remove), onTap: () {
                      log('remove detected');
                      cartcontrol.incrementDecrementQty(
                        -1,
                        cartcontrol.cartList!.products[index].product.id,
                        cartcontrol.cartList!.products[index].qty,
                        cartcontrol.cartList!.products[index].product.size
                            .toString());
                    }
                        //  cartcontrol.deleting(),
                        ),
              )
            ],
          )
        ],
      ),
    );
  }
}
