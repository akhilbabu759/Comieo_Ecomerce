import 'dart:ui';

import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:flutter/material.dart';

class OrderSummery extends StatelessWidget {
  const OrderSummery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: colorWhite,
          leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back_ios,
                color: colorblack,
              )),
          title: Text(
            'Order Summary',
            style: TextStyle(color: colorblack, fontSize: 20),
          )),
      body: SafeArea(
          child: Column(
        children: [
          Row(
            children: [
              textFieldGap,
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
          )
        ],
      )),
    );
  }
}
