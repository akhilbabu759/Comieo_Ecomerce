import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';
import 'package:ecomerce/screen/account/edit_account/view/account_add.dart';
import 'package:ecomerce/screen/account/view_acount/widget/account_add.dart';
import 'package:ecomerce/screen/order_summery/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllAccountView extends StatelessWidget {
  AllAccountView({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  final accountC = Get.put(AcountController());
  final orderSummerC=Get.put(OrderCOntrollerSummery());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        actions: [
          IconButton(
            onPressed: () {
              Get.to(
                () => AddAccountPage(
                  width: width,
                  height: height,
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
        centerTitle: true,
        title: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: 'All',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              )),
          TextSpan(
              text: 'adresses',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
              ))
        ])),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.04),
          child: const SizedBox(),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<AcountController>(
          builder: (controller) {
            return accountC.isLoading == true
                ? const Center(
                    child: CircularProgressIndicator(
                      color: colorWhite,
                      backgroundColor: Colors.cyan,
                    ),
                  )
                : accountC.addressList.isEmpty
                    ? Center(
                        child: Text(
                          'No Address',
                          style: textstyle,
                        ),
                      )
                    : ListView.builder(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 10.0,
                              right: 10,
                            ),
                            child: GestureDetector(onTap: () {
                              orderSummerC.indexChange(index);
                              accountC.changeinde(index);
                            } ,
                              child: Container(
                                width: double.infinity,
                                height: height * 0.258,
                                decoration: BoxDecoration(
                                    color:orderSummerC.index==index?Colors.blueGrey[50]: colorWhite,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white12,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    right: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                        accountC.addressList[index].fullName,
                                        style: const TextStyle(
                                            color: colorblack,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(accountC.addressList[index].state),
                                      Text(
                                          '${accountC.addressList[index].place},${accountC.addressList[index].pin}'),
                                      Text(
                                          'Phone number: ${accountC.addressList[index].phone}'),
                                      Text(
                                          'Delivary location: ${accountC.addressList[index].landMark}'),
                                      kHeight10,
                                      Row(
                                        children: [
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: const BorderSide(
                                                color: colorblack,
                                              ),
                                              maximumSize: Size(
                                                  width * 0.37, height * 0.07),
                                              minimumSize: Size(
                                                width * 0.16,
                                                height * 0.006,
                                              ),
                                            ),
                                            onPressed: () {
                                              Get.off(EditAccountPage(
                                                height: height,
                                                width: width,
                                                model:
                                                    accountC.addressList[index],
                                              ));
                                            },
                                            child: const Text(
                                              'Edit',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: colorblack),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              maximumSize: Size(
                                                  width * 0.37, height * 0.07),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              side: const BorderSide(
                                                color: colorblack,
                                              ),
                                              minimumSize: Size(
                                                width * 0.16,
                                                height * 0.006,
                                              ),
                                            ),
                                            onPressed: () {
                                              accountC.deleteAddress(
                                                  accountC.addressList[index].id);
                                            },
                                            child: const Text(
                                              'Remove',
                                              style: TextStyle(
                                                fontSize: 15,
                                                color: colorblack,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        itemCount: accountC.addressList.length,
                      );
          },
        ),
      ),
    );
  }
}
