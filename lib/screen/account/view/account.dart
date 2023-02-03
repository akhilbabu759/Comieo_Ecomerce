import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/account/view/widget/row_account.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 45.0, left: 10),
            child: Text(
              "Hey! akhil",
              style: TextStyle(color: colorblack, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            color: Colors.grey.shade200,
            height: 120,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Account Settings',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  textFieldGap,
                  const RowAccount(
                    text: ' Orders',
                    icon: Icon(Icons.shopping_basket),
                  ),
                  textFieldGap,
                  const RowAccount(
                    text: 'Saved Addresses',
                    icon: Icon(Icons.location_on),
                  )
                ],
              ),
            ),
          ),
          textFieldGap,
          Container(
            color: Colors.grey.shade200,
            height: 150,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Row(
                  children: const [
                    Text(
                      'feedBack & Information',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                textFieldGap,
                const RowAccount(
                    text: 'Terms and conditions',
                    icon: Icon(Icons.my_library_books)),
                textFieldGap,
                const RowAccount(
                  text: 'Privice police',
                  icon: Icon(
                    Icons.privacy_tip,
                  ),
                ),
                textFieldGap,
                const RowAccount(
                  text: 'About',
                  icon: Icon(
                    Icons.info,
                  ),
                )
              ]),
            ),
          ),
          textFieldGap,
          Container(
            color: Colors.grey.shade200,
            height: 49,
            width: Get.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Row(
                  children: const [
                    Icon(
                      Icons.login,
                      color: colorRed,
                    ),
                    SizedBox(width: 20),
                    Text(
                      'LogOut',
                      style: TextStyle(color: colorRed),
                    )
                  ],
                )
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Get.width * 0.4,
              top: Get.height * 0.29,
            ),
            child: const Text('Version 1.0.0'),
          )
        ],
      ),
    );
  }
}
