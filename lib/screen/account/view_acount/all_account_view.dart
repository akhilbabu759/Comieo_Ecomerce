import 'package:ecomerce/core/constent.dart';
import 'package:ecomerce/core/text_style.dart';
import 'package:ecomerce/screen/account/account_main/controller/account_controller.dart';
import 'package:ecomerce/screen/account/edit_account/view/account_add.dart';
import 'package:ecomerce/screen/account/view_acount/widget/account_add.dart';
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
                color: Colors.yellow,
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
                    : ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: double.infinity,
                              height: height * 0.35,
                              decoration: BoxDecoration(
                                  color: colorWhite,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.white12)),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
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
                                              width * 0.2,
                                              height * 0.06,
                                            ),
                                          ),
                                          onPressed: () {
                                            Get.to(EditAccountPage(
                                              height: height,
                                              width: width,
                                              model:
                                                  accountC.addressList[index],
                                            ));
                                          },
                                          child: Text(
                                            'Edit',
                                            style: textstyle,
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
                                              width * 0.2,
                                              height * 0.06,
                                            ),
                                          ),
                                          onPressed: () {
                                            accountC.deleteAddress(
                                                accountC.addressList[index].id);
                                          },
                                          child: Text(
                                            'Remove',
                                            style: textstyle,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox();
                        },
                        itemCount: accountC.addressList.length,
                      );
          },
        ),
      ),
    );
  }
}
