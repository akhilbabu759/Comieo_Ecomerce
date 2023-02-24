import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/screen/account/about/about.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';

import 'package:ecomerce/screen/account/account_main/view/widget/row_account.dart';
import 'package:ecomerce/screen/account/privacy_police/privacy.dart';
import 'package:ecomerce/screen/account/terms_and_Condtion/terms_and_condition.dart';
import 'package:ecomerce/screen/account/view_acount/all_account_view.dart';
import 'package:ecomerce/screen/order_place_page.dart/view/order_place.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final accountC = Get.put(AcountController());
    return Scaffold(
      body: Column(
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
                  GestureDetector(
                    onTap: () => Get.to(const OrderPlace()),
                    child: const RowAccount(
                      text: ' Orders',
                      icon: Icon(Icons.shopping_basket),
                    ),
                  ),
                  textFieldGap,
                  GestureDetector(
                    onTap: () => Get.to(AllAccountView(
                      width: Get.width,
                      height: Get.height,
                    )),
                    child: const RowAccount(
                      text: 'Saved Addresses',
                      icon: Icon(Icons.location_on),
                    ),
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
                GestureDetector(
                  onTap: () => Get.to(const TermsAndCondion()),
                  child: const RowAccount(
                      text: 'Terms and conditions',
                      icon: Icon(Icons.my_library_books)),
                ),
                textFieldGap,
                GestureDetector(
                  onTap: () => Get.to(const Privice()),
                  child: const RowAccount(
                    text: 'Privacy policy',
                    icon: Icon(
                      Icons.privacy_tip,
                    ),
                  ),
                ),
                textFieldGap,
                GestureDetector(
                  onTap: () => Get.to(const AboutPage()),
                  child: const RowAccount(
                    text: 'About',
                    icon: Icon(
                      Icons.info,
                    ),
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
                InkWell(
                  onTap: () => Get.defaultDialog(
                    middleText: 'Do you want to Delete !!',
                    textConfirm: 'Yes',
                    textCancel: 'No',
                    onConfirm: () => accountC.logout(),
                  ),
                  child: Row(
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
                  ),
                )
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: Get.width * 0.01,
              top: Get.height * 0.23,
            ),
            child: const Text('Version 1.0.0'),
          )
        ],
      ),
    );
  }
}
