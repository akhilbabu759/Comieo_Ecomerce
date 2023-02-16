import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/cart/controller/cart_controller.dart';
import 'package:ecomerce/screen/order_summery/view/widget/addrees_container.dart';

import 'package:flutter/material.dart';


class BeforeBottom extends StatelessWidget {
  const BeforeBottom({
    Key? key,
    required this.cartcontrol,
  }) : super(key: key);

  final CartController cartcontrol;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            textFieldGap,
            Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Deliver to:'),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 255, 255, 255)),
                  elevation: MaterialStateProperty.all(0),
                  side: MaterialStateProperty.all(
                      const BorderSide(color: colorblack))),
              onPressed: () {},
              child: const Text(
                'Change',
                style: TextStyle(color: colorblack),
              ))
        ],
            ),
             AddressContainer(),
            
            
          ],
        ),
      );
  }
}
