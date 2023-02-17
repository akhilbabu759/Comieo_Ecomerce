import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../account/account_main/controller/account_controller.dart';

class AddressContainer extends StatelessWidget {
  AddressContainer({
    Key? key,
  }) : super(key: key);
  final addresscontrol = Get.put(AcountController());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  addresscontrol.addressList[0].fullName,
                  style: const TextStyle(fontSize: 24),
                ),
                Card(
                  color: Colors.white60,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                        width: 45,
                      ),
                      Text(addresscontrol.addressList[0].title),
                    ],
                  ),
                ),
              ],
            ),

            //  Row(children: [
            //   IconButton(onPressed: () {

            //   }, icon: Icon(Icons.edit)),
            //   IconButton(onPressed: () {

            //   }, icon: Icon(Icons.delete))

            //  ],)
          ],
        ),
        Text(addresscontrol.addressList[0].address),
        Text('PIN:${addresscontrol.addressList[0].pin}'),
        Text(
            '${addresscontrol.addressList[0].state}, ${addresscontrol.addressList[0].place}'),
        const SizedBox(
          height: 5,
        ),
        Text(addresscontrol.addressList[0].phone),
        const SizedBox(
          height: 10,
        ),
      ]),
    );
  }
}
