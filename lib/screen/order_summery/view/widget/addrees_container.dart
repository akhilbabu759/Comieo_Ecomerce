import 'package:ecomerce/screen/order_summery/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../account/account_main/controller/account_controller.dart';

class AddressContainer extends StatelessWidget {
  AddressContainer({
    Key? key,
  }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    final addresscontrol = Get.put(AcountController());
     final orderCOntrollerSummery = Get.put(OrderCOntrollerSummery());

    return GetBuilder<OrderCOntrollerSummery>(builder: (controller) {
      return Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    addresscontrol.addressList[orderCOntrollerSummery.index].fullName,
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
                        Text(addresscontrol.addressList[orderCOntrollerSummery.index].title),
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
          Text(addresscontrol.addressList[orderCOntrollerSummery.index].address),
          Text('PIN:${addresscontrol.addressList[controller.index].pin}'),
          Text(
              '${addresscontrol.addressList[orderCOntrollerSummery.index].state}, ${addresscontrol.addressList[orderCOntrollerSummery.index].place}'),
          const SizedBox(
            height: 5,
          ),
          Text(addresscontrol.addressList[orderCOntrollerSummery.index].phone),
          const SizedBox(
            height: 10,
          ),
        ]),
      );
    },
    );
  }
}
